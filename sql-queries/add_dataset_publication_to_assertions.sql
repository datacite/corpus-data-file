BEGIN;

ALTER TABLE assertions ADD COLUMN dataset TEXT, ADD COLUMN publication TEXT;

UPDATE assertions
SET dataset = subj_id,
    publication = obj_id
WHERE source_type = 'datacite-crossref'
   OR source_type IS NULL;

UPDATE assertions
SET dataset = obj_id,
    publication = subj_id
WHERE source_type = 'crossref';

COMMIT;