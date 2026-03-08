# QR Landing PHP App

Minimal PHP/MySQL app for a single QR landing page with a simple admin UI.

Installation
1. Upload files to your shared hosting document root (preserve directories).
2. Create a MySQL database. The app will auto-migrate the schema on first access.
   
   Optional: if you prefer to manually import the schema, use:
   
   ```bash
   mysql -u DBUSER -p DBNAME < db/schema.sql
   ```

3. Generate an admin password hash locally and paste into `credentials.json`:

```bash
php -r "echo password_hash('YOUR_PASSWORD', PASSWORD_DEFAULT).PHP_EOL;"
```

4. Create a `credentials.json` file outside the webroot or set the environment variable `QR_CREDENTIALS_FILE` to point to it. The loader will check the env var first, then `../credentials.json` relative to the project directory.

Example `credentials.json` (do NOT commit this file):

```json
{
  "DB_HOST": "localhost",
  "DB_NAME": "qr_app",
  "DB_USER": "qr_user",
  "DB_PASS": "supersecret",
  "BASE_URL": "https://your-domain.tld",
  "ADMIN_PASS_HASH": "<paste_password_hash_here>",
  "ANONYMIZE_IP": true,
  "ALLOW_HTML_WHITELIST": true,
  "SESSION_COOKIE_SECURE": true
}
```

5. Ensure HTTPS is enabled on your host. Set `session.cookie_secure` to 1 (true) in `credentials.json` or via `config.php`.
6. Visit `https://your-domain.tld/admin/login.php` and log in.

Security notes
- IP anonymization is enabled by default. Disable by setting `ANONYMIZE_IP` to false in your `credentials.json`.
- Allowed HTML is limited by a simple whitelist. For stronger sanitization use e.g. HTML Purifier.

If any files need adjustments for your host (e.g. no .htaccess), edit accordingly.
