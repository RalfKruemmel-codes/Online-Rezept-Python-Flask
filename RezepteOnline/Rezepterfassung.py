from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from db_config import db_config

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = f"mysql+mysqlconnector://{db_config['user']}:{db_config['password']}@{db_config['host']}:{db_config['port']}/{db_config['database']}"
db = SQLAlchemy(app)

class Rezept(db.Model):
    __tablename__ = 'rezepte'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255))
    beschreibung = db.Column(db.Text)
    zubereitungszeit = db.Column(db.String(255))
    portionen = db.Column(db.Integer)
    zubereitung = db.Column(db.Text)

class Zutat(db.Model):
    __tablename__ = 'zutaten'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255))

class RezeptZutat(db.Model):
    __tablename__ = 'rezept_zutaten'
    rezept_id = db.Column(db.Integer, db.ForeignKey('rezepte.id'), primary_key=True)
    zutaten_id = db.Column(db.Integer, db.ForeignKey('zutaten.id'), primary_key=True)
    menge = db.Column(db.Float)

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
    
    rezepte = Rezept.query.all()
    zutaten = Zutat.query.all()
    return render_template('rezept_erfassung.html', rezepte=rezepte, zutaten=zutaten)

@app.route('/zutat_hinzufuegen', methods=['POST'])
def zutat_hinzufuegen():
    rezept_id = request.form.get('rezept_id')
    zutaten_id = request.form.get('zutaten_id')
    menge = request.form.get('menge')

    neue_zutat = RezeptZutat(rezept_id=rezept_id, zutaten_id=zutaten_id, menge=menge)
    db.session.add(neue_zutat)
    db.session.commit()

    return redirect(url_for('rezept_erfassung'))

if __name__ == '__main__':
    app.run(debug=True)
