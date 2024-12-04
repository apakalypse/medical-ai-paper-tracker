CREATE TABLE papers (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    authors TEXT NOT NULL,
    abstract TEXT,
    source TEXT NOT NULL,
    publication_date TEXT NOT NULL,
    access_date TEXT NOT NULL,
    pdf_path TEXT,
    bibtex_path TEXT,
    endnote_path TEXT,
    is_paywalled BOOLEAN DEFAULT FALSE,
    summary TEXT,
    implications TEXT,
    topic_category TEXT,
    error_log TEXT
);

CREATE TABLE tags (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE paper_tags (
    paper_id TEXT,
    tag_id INTEGER,
    PRIMARY KEY (paper_id, tag_id),
    FOREIGN KEY (paper_id) REFERENCES papers(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE INDEX idx_papers_publication_date ON papers(publication_date);
CREATE INDEX idx_papers_source ON papers(source);
CREATE INDEX idx_papers_topic ON papers(topic_category);