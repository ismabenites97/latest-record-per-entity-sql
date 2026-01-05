WITH LATEST_RECORD_BY_ENTITY AS (
    SELECT
        ranked.entity_id,
        ranked.entity_code,
        ranked.record_id
    FROM (
        SELECT
            hist.*,
            ROW_NUMBER() OVER (
                PARTITION BY hist.entity_id
                ORDER BY rec.record_id DESC
            ) AS rn_latest
        FROM entity_history hist
        INNER JOIN records rec
            ON rec.record_id = hist.record_id
    ) ranked
    WHERE ranked.rn_latest = 1
)

SELECT
    rec.record_id,
    rec.entity_code
FROM LATEST_RECORD_BY_ENTITY ent
INNER JOIN records rec
    ON rec.record_id = ent.record_id
   AND rec.entity_id  = ent.entity_id;
