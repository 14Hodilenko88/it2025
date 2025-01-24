-- Active: 1735983799458@@localhost@5432@intelligencemanagementdb
-- Create the database
CREATE DATABASE IntelligenceManagementDB;

-- Connect to the database
\c IntelligenceManagementDB;

-- Create the table
CREATE TABLE IntelligenceReports (
    ReportID SERIAL PRIMARY KEY,
    ReportType VARCHAR(100) NOT NULL,
    Source VARCHAR(255) NOT NULL,
    DateCollected DATE NOT NULL,
    AnalysisSummary TEXT NOT NULL,
    PriorityLevel VARCHAR(10) CHECK (PriorityLevel IN ('Low', 'Medium', 'High', 'Critical')) NOT NULL
);

-- Insert example data
INSERT INTO IntelligenceReports (ReportType, Source, DateCollected, AnalysisSummary, PriorityLevel)
VALUES
('Surveillance', 'Drone A1', '2025-01-18', 'Detected unusual activity near the border.', 'High'),
('Signal Intelligence', 'Satellite S3', '2025-01-17', 'Interception of encrypted communications.', 'Critical'),
('Human Intelligence', 'Agent X9', '2025-01-15', 'Confirmation of enemy movement.', 'Medium');
