How-to: Rezept-Webanwendung
Willkommen bei der Rezept-Webanwendung! Diese Anleitung führt Sie durch die Schritte zum Herunterladen, Installieren und Verwenden der Anwendung.

Voraussetzungen
Bevor Sie beginnen, stellen Sie sicher, dass Sie Python und pip auf Ihrem Computer installiert haben. Sie benötigen auch Zugriff auf eine MySQL-Datenbank.

Installation
Klonen Sie das Repository: Öffnen Sie Ihre Kommandozeile oder Ihr Terminal und führen Sie den folgenden Befehl aus, um das Projekt zu klonen:

git clone https://github.com/IhrBenutzername/IhrRepository.git

Ersetzen Sie {IhrBenutzername/IhrRepository} durch den tatsächlichen Pfad zu Ihrem GitHub-Repository.

Wechseln Sie in das Projektverzeichnis:

cd IhrRepository

Erstellen Sie eine virtuelle Umgebung (optional, aber empfohlen):

python -m venv venv

Aktivieren Sie die virtuelle Umgebung:

Windows: venv\Scripts\activate

macOS/Linux: source venv/bin/activate

Installieren Sie die erforderlichen Pakete:

pip install -r requirements.txt

Erstellen Sie die Datenbank: 
Melden Sie sich bei Ihrer MySQL-Datenbank an und erstellen Sie die Datenbank mit dem SQL-Skript, das im Ordner static/sql/ liegt.

Verwendung
Starten Sie die Anwendung: Führen Sie den folgenden Befehl aus, um die Flask-Anwendung zu starten:

python app.py

Die Anwendung wird auf http://localhost:5000 gehostet.

Öffnen Sie die Anwendung in Ihrem Browser: 
Gehen Sie zu http://localhost:5000 in Ihrem Webbrowser, um die Anwendung zu verwenden.

Funktionen

Rezepterfassung: Auf der Seite “Rezepterfassung” können Sie neue Rezepte mit Namen, Beschreibung, Zubereitungszeit, Portionen und Zubereitungsschritten erfassen.

Zutatenerfassung: Sie können Zutaten zu einem ausgewählten Rezept hinzufügen, indem Sie die Zutat, die Menge und die Einheit angeben.

Rezeptübersicht: Auf der Startseite können Sie eine Liste aller erfassten Rezepte sehen. Klicken Sie auf ein Rezept, um Details anzuzeigen.

Mengenanpassung: Auf der Detailseite eines Rezepts können Sie die Anzahl der Portionen anpassen. Die Zutatenmengen werden automatisch aktualisiert, um der neuen Portionenanzahl zu entsprechen.

Viel Spaß beim Kochen und Teilen Ihrer Rezepte!

