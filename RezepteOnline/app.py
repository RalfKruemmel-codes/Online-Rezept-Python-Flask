from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from db_config import db_config
from flask import redirect, url_for


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = f"mysql+mysqlconnector://{db_config['user']}:{db_config['password']}@{db_config['host']}:{db_config['port']}/{db_config['database']}"
db = SQLAlchemy(app)

class Rezept(db.Model):
    __tablename__ = 'rezepte'
    id = db.Column(db.Integer, primary_key=True, name='RezeptID')
    name = db.Column(db.String(255), name='Name')
    beschreibung = db.Column(db.Text, name='Beschreibung')
    zubereitungszeit = db.Column(db.String(255), name='Zubereitungszeit')
    portionen = db.Column(db.Integer, name='Portionen')
    zubereitung = db.Column(db.Text, name='Zubereitung')

class Zutat(db.Model):
    __tablename__ = 'zutaten'
    id = db.Column(db.Integer, primary_key=True, name='ZutatenID')
    name = db.Column(db.String(255), name='Name')
    basismenge = db.Column(db.Float, name='Basismenge')
    basiseinheit = db.Column(db.String(50), name='Basiseinheit')

class RezeptZutat(db.Model):
    __tablename__ = 'rezept_zutaten'
    rezept_id = db.Column(db.Integer, db.ForeignKey('rezepte.RezeptID'), primary_key=True, name='RezeptID')
    zutaten_id = db.Column(db.Integer, db.ForeignKey('zutaten.ZutatenID'), primary_key=True, name='ZutatenID')
    menge = db.Column(db.Float, name='Menge')
    rezept = db.relationship('Rezept', backref=db.backref('rezept_zutaten'))
    zutat = db.relationship('Zutat', backref=db.backref('rezept_zutaten'))

@app.route('/')
def index():
    rezepte = Rezept.query.all()
    return render_template('index.html', rezepte=rezepte)

@app.route('/rezept/<int:rezept_id>')
def rezept_detail(rezept_id):
    rezept = Rezept.query.get_or_404(rezept_id)
    rezept_zutaten = RezeptZutat.query.filter_by(rezept_id=rezept_id).all()
    return render_template('rezept_detail.html', rezept=rezept, rezept_zutaten=rezept_zutaten)

@app.route('/rezept_anpassen/<int:rezept_id>', methods=['POST'])
def rezept_anpassen(rezept_id):
    rezept = Rezept.query.get_or_404(rezept_id)
    neue_portionen = int(request.form['neue_portionen'])
    rezept_zutaten = RezeptZutat.query.filter_by(rezept_id=rezept_id).all()
    angepasste_zutaten = [{'zutat': rz.zutat, 'menge': rz.menge * (neue_portionen / rezept.portionen), 'einheit': rz.zutat.basiseinheit} for rz in rezept_zutaten]
    return render_template('rezept_detail.html', rezept=rezept, rezept_zutaten=angepasste_zutaten, neue_portionen=neue_portionen)

@app.route('/rezept_erfassung', methods=['GET', 'POST'])
def rezept_erfassung():
    if request.method == 'POST':
        # Daten aus dem Formular holen
        name = request.form['name']
        beschreibung = request.form['beschreibung']
        zubereitungszeit = request.form['zubereitungszeit']
        portionen = request.form['portionen']
        zubereitung = request.form['zubereitung']
        
        # Neues Rezept erstellen und in die Datenbank einfügen
        neues_rezept = Rezept(name=name, beschreibung=beschreibung, zubereitungszeit=zubereitungszeit, portionen=portionen, zubereitung=zubereitung)
        db.session.add(neues_rezept)
        db.session.commit()
        
        return redirect(url_for('rezept_erfassung'))
    
    # Alle Rezepte und Zutaten für die Drop-Down-Listen holen
    rezepte = Rezept.query.all()
    zutaten = Zutat.query.all()
    return render_template('rezept_erfassung.html', rezepte=rezepte, zutaten=zutaten)

@app.route('/zutat_hinzufuegen', methods=['POST'])
def zutat_hinzufuegen():
    rezept_id = request.form.get('rezept_id')
    zutaten_id = request.form.get('zutaten_id')
    menge = request.form.get('menge')

    # Überprüfen, ob der Eintrag bereits existiert
    eintrag = RezeptZutat.query.filter_by(rezept_id=rezept_id, zutaten_id=zutaten_id).first()
    if eintrag:
        # Eintrag existiert bereits, Fehlermeldung zurückgeben oder aktualisieren
        return "Eintrag existiert bereits.", 400
    else:
        # Neuen Eintrag hinzufügen
        neue_zutat = RezeptZutat(rezept_id=rezept_id, zutaten_id=zutaten_id, menge=menge)
        db.session.add(neue_zutat)
        try:
            db.session.commit()
        except sqlalchemy.exc.IntegrityError:
            db.session.rollback()
            return "Ein Fehler ist aufgetreten.", 400

    return redirect(url_for('rezept_erfassung'))




if __name__ == '__main__':
    with app.app_context():
        db.create_all()
    app.run(debug=True)
