DELETE FROM slg.mst_group_exclude_detail
USING slg.mst_group_exclude
WHERE slg.mst_group_exclude_detail.group_id = slg.mst_group_exclude.group_id
AND slg.mst_group_exclude.group_name = 'TEST CREATE ALL FLAG';

Delete from slg.mst_group_exclude
where group_name = 'TEST CREATE ALL FLAG';
