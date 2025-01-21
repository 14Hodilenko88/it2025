from flask import Flask, render_template, request, redirect, url_for, flash
import psycopg2

app = Flask(__name__)
app.secret_key = '111'  # Для повідомлень Flash

# Конфігурація бази даних
DB_CONFIG = {
    'dbname': 'intelligencemanagementdb',
    'user': 'postgres',
    'password': 'admin',
    'host': 'localhost',
    'port': 5432
}

# Функція для підключення до бази даних
def get_db_connection():
    return psycopg2.connect(**DB_CONFIG)

# Головна сторінка (Read)
@app.route('/')
def index():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT reportid, reporttype, source, datecollected, analysissummary FROM intelligencereports order by reportid")
    records = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('index.html', records=records)

# Сторінка для створення запису (Create)
@app.route('/create', methods=['GET', 'POST'])
def create():
    if request.method == 'POST':
        reporttype = request.form['reporttype']
        source = request.form['source']
        datecollected = request.form['datecollected']
        analysissummary = request.form['analysissummary']

        if not all([reporttype, source, datecollected, analysissummary]):
            flash('All fields are required!', 'error')
            return redirect(url_for('create'))

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute(
            "INSERT INTO intelligencereports (reporttype, source, datecollected, analysissummary) VALUES (%s, %s, %s, %s)",
            (reporttype, source, datecollected, analysissummary)
        )
        conn.commit()
        cur.close()
        conn.close()
        flash('Record created successfully!', 'success')
        return redirect(url_for('index'))

    return render_template('create.html')

# Сторінка для редагування запису (Update)
@app.route('/edit/<int:reportid>', methods=['GET', 'POST'])
def edit(reportid):
    conn = get_db_connection()
    cur = conn.cursor()

    if request.method == 'POST':
        reporttype = request.form['reporttype']
        source = request.form['source']
        datecollected = request.form['datecollected']
        analysissummary = request.form['analysissummary']

        if not all([reporttype, source, datecollected, analysissummary]):
            flash('All fields are required!', 'error')
            return redirect(url_for('edit', reportid=reportid))

        cur.execute(
            "UPDATE intelligencereports SET reporttype = %s, source = %s, datecollected = %s, analysissummary = %s WHERE reportid = %s",
            (reporttype, source, datecollected, analysissummary, reportid)
        )
        conn.commit()
        cur.close()
        conn.close()
        flash('Record updated successfully!', 'success')
        return redirect(url_for('index'))

    cur.execute("SELECT reportid, reporttype, source, datecollected, analysissummary FROM intelligencereports WHERE reportid = %s", (reportid,))
    record = cur.fetchone()
    cur.close()
    conn.close()
    return render_template('edit.html', record=record)

# Видалення запису (Delete)
@app.route('/delete/<int:reportid>', methods=['POST'])
def delete(reportid):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("DELETE FROM intelligencereports WHERE reportid = %s", (reportid,))
    conn.commit()
    cur.close()
    conn.close()
    flash('Record deleted successfully!', 'success')
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)
