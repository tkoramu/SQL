-- MySQLとPostgreSQLはエラーがない。しかし、それ以外はエラーが出るかも。
SELECT shohin_bunrui AS sb, COUNT(*)
FROM Shohin
GROUP BY sb;
