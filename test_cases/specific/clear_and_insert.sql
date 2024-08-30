DELETE FROM slg.mst_group_specific_detail
USING slg.mst_group_specific
WHERE slg.mst_group_specific_detail.group_id = slg.mst_group_specific.group_id
AND slg.mst_group_specific.group_name = 'TEST CREATE ALL FLAG';

Delete from slg.mst_group_specific
where group_name = 'TEST CREATE ALL FLAG';
