SELECT COUNT(*) AS active_pages_count
FROM (
    SELECT DISTINCT ON (page_id) page_id, status
    FROM page_status_log
    ORDER BY page_id, changed_at DESC
) AS latest_statuses
WHERE status = 'active';
