from flask import Flask, render_template, request, redirect, url_for, flash
import psycopg2
from psycopg2.extras import DictCursor
from datetime import datetime

# Flask application setup
app = Flask(__name__)
app.secret_key = "111"  # For flash messages

# PostgreSQL connection configuration
DB_CONFIG = {
    "dbname": "intelligencemanagementdb",
    "user": "postgres",
    "password": "admin",
    "host": "localhost",
    "port": 5432
}

# Helper function to get a database connection
def get_db_connection():
    conn = psycopg2.connect(**DB_CONFIG)
    return conn

# Route: View all reports
@app.route('/')
def index():
    conn = get_db_connection()
    cur = conn.cursor(cursor_factory=DictCursor)
    cur.execute("SELECT * FROM intelligencereports ORDER BY reportid;")
    reports = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('index.html', reports=reports)

# Route: Add a new report
@app.route('/add', methods=['GET', 'POST'])
def add_report():
    if request.method == 'POST':
        report_type = request.form['report_type']
        source = request.form['source']
        date_collected = request.form['date_collected']
        analysis_summary = request.form['analysis_summary']
        priority_level = request.form['priority_level']

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("""
            INSERT INTO intelligencereports (reporttype, source, datecollected, analysissummary, prioritylevel)
            VALUES (%s, %s, %s, %s, %s);
        """, (report_type, source, date_collected, analysis_summary, priority_level))
        conn.commit()
        cur.close()
        conn.close()

        flash("Report added successfully!", "success")
        return redirect(url_for('index'))

    return render_template('add_report.html')

# Route: Edit an existing report
@app.route('/edit/<int:report_id>', methods=['GET', 'POST'])
def edit_report(report_id):
    conn = get_db_connection()
    cur = conn.cursor(cursor_factory=DictCursor)

    # Fetch the report to edit
    cur.execute("SELECT * FROM intelligencereports WHERE reportid = %s;", (report_id,))
    report = cur.fetchone()

    if request.method == 'POST':
        report_type = request.form['report_type']
        source = request.form['source']
        date_collected = request.form['date_collected']
        analysis_summary = request.form['analysis_summary']
        priority_level = request.form['priority_level']

        cur.execute("""
            UPDATE IntelligenceReports
            SET ReportType = %s, Source = %s, DateCollected = %s, AnalysisSummary = %s, PriorityLevel = %s
            WHERE ReportID = %s;
        """, (report_type, source, date_collected, analysis_summary, priority_level, report_id))
        conn.commit()
        cur.close()
        conn.close()

        flash("Report updated successfully!", "success")
        return redirect(url_for('index'))

    cur.close()
    conn.close()
    return render_template('edit_report.html', report=report)

# Route: Delete a report
@app.route('/delete/<int:report_id>')
def delete_report(report_id):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("DELETE FROM IntelligenceReports WHERE ReportID = %s;", (report_id,))
    conn.commit()
    cur.close()
    conn.close()

    flash("Report deleted successfully!", "success")
    return redirect(url_for('index'))

# Run the Flask app
if __name__ == '__main__':
    app.run(debug=True)
