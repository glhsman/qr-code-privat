# QR Landing Page - Projektfortschritt

## ✅ Abgeschlossen (März 5, 2026) – Lokaler XAMPP-Test

### Lokale Testumgebung aufgesetzt (XAMPP)
- [x] Projektordner nach `D:\xampp\htdocs\QR_WebApp\` kopiert
- [x] `credentials.json` (mit echten Werten) eine Ebene über dem Projektordner abgelegt: `D:\xampp\htdocs\credentials.json`
- [x] Syntaxfehler in `credentials.json` behoben (JSON war ungültig)
- [x] `SESSION_COOKIE_SECURE: false` gesetzt (XAMPP nutzt kein HTTPS lokal)
- [x] `BASE_URL` auf `http://localhost/QR_WebApp` angepasst
- [x] Datenbank `qrcode` in phpMyAdmin angelegt (Auto-Migration erledigt den Rest)
- [x] Admin-Passwort-Hash per `set_pass.php` generiert und direkt in `credentials.json` gespeichert
- [x] Admin-Login erfolgreich getestet unter `http://localhost/QR_WebApp/admin/login.php`
- [x] Landing-Page getestet unter `http://localhost/QR_WebApp/scan/`

### Neue Hilfsdateien (temporär, vor Go-Live löschen!)
- [x] `admin/set_pass.php` – Passwort-Hash generieren & direkt in `credentials.json` schreiben (auch für Produktivsystem nutzbar, danach löschen)
- [x] `debug_config.php` – prüft ob `credentials.json` gefunden und korrekt gelesen wird
- [x] `debug_login.php` – testet `password_verify` mit hardcodiertem Passwort direkt gegen den gespeicherten Hash
- [x] `gen_hash.php` – generiert bcrypt-Hash im Browser

### Neu: Scan-Landingpage modernisiert
- [x] `scan/index.php` komplett neu gestaltet:
  - Farbverlauf-Hintergrund (lila → blau, passend zu `index.html`)
  - Google Font „Inter" für moderne Typografie
  - Card-Layout mit violettem Header-Streifen
  - Große, luftige Nachrichtenanzeige (1.25rem)
  - Glassmorphism-Logo oben
  - SlideUp-Animation beim Laden
  - Pulsierender Live-Indikator unten
  - Vollständig responsiv für mobile Geräte

- [x] `admin/login.php` – temporären Debug-Code entfernt, Syntaxfehler (doppeltes `}`) behoben

### Hinweise für Produktivsystem
- Der lokal generierte Hash in `credentials.json` ist **portabel** – kann direkt auf den Webspace übertragen werden
- Alternativ: `set_pass.php` auf den Webspace laden, Passwort setzen, Skript sofort löschen
- `credentials.json` gehört **eine Ebene über** dem Webroot (z. B. außerhalb von `public_html/`)

## ✅ Abgeschlossen (März 4, 2026)

### UI & Design
- [x] Admin-Button von Startseite entfernt
- [x] Zurück-Button von Startseite entfernt
- [x] QR-Code Anzeige-Bereich von `index.html` (Vorschau) entfernt
- Admin-Bereich ist nur über direkte URL in der Adressbar erreichbar (versteckt für normale Benutzer)

### Sprache
- [x] Alle User-sichtbaren Texte ins Deutsche übersetzt:
  - `index.html`: Titel, Preview-Text
  - `admin/login.php`: Anmeldeseite
  - `admin/index.php`: Abmeldebutton, Tabellenkopfzeilen
  - `scan/index.php`: War bereits auf Deutsch

### Statistiken
- [x] Gesamtzähler für alle Scans hinzugefügt: `count_all_scans()`
- [x] Tageszähler für heutige Scans hinzugefügt: `count_today_scans()`
- [x] Beide Zähler im Admin-Dashboard angezeigt (oberhalb der Tabelle "Letzte Scans")

### Konfiguration & Sicherheit
- [x] `credentials.json` mit Platzhaltern erstellt (eine Ebene über dem Projekt)
- [x] `.gitignore` korrekt gefüllt (credentials.json wird nicht gepusht)
- [x] Datenbankschema mit Auto-Migration funktioniert

## 📋 Noch zu tun

### Vor dem Go-Live
- [ ] `credentials.json` mit echten Werten füllen:
  - `DB_HOST`, `DB_NAME`, `DB_USER`, `DB_PASS`
  - `BASE_URL` setzen (z.B. https://deine-domain.tld)
  - `ADMIN_PASS_HASH` generieren mit: `php -r "echo password_hash('DEIN_PASSWORT', PASSWORD_DEFAULT).PHP_EOL;"`
- [ ] QR-Code generieren und auf Materialien ausdrucken
- [ ] `scan/index.php` testen (nach QR-Scan angezeigt)
- [ ] Admin-Login testen und Testmeldung speichern

### Optional (zukünftige Features)
- [ ] QR-Code dynamisch im Admin generieren und anziehen
- [ ] Weitere Statistiken (z.B. Scans pro Tag, Top User Agents)
- [ ] Export der Scan-Daten
- [ ] Mehrere Landing-Message-Templates
- [ ] Admin-Interface verschönern (CSS)

## 🏗️ Projektstruktur

```
QR_WebApp/
├── index.html              # Vorschau-Seite (keine Admin-Buttons mehr)
├── config.php              # Konfiguration (lädt credentials.json)
├── .gitignore              # Sicherheit: credentials.json ausgeschlossen
├── admin/
│   ├── index.php           # Admin-Dashboard mit Statistiken
│   ├── login.php           # Admin-Anmeldeseite
│   ├── logout.php
│   └── save.php
├── scan/
│   └── index.php           # Landing-Page nach QR-Scan
├── lib/
│   ├── db.php              # DB-Funktionen (count_all_scans, count_today_scans)
│   └── sanitize.php
├── public/
└── db/
    └── schema.sql
```

## 🔐 Dateien mit Credentials (NICHT pushen!)

- `../credentials.json` (eine Ebene über dem Projekt) → In `.gitignore`

## 🎯 Letzte Änderungen (heute)

- UI: Buttons entfernt, QR-Code-Bereich entfernt
- Backend: Scan-Zähler hinzugefügt
- Localization: Alle Texte auf Deutsch
- Config: credentials.json Setup vorbereitet
