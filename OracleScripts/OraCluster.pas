unit OraCluster;

interface

function GetCluster(OwnerName, ClusterType: string): string;
function GetClusterColumns(OwnerName, table_name: string): string;

implementation

uses Util;

function GetCluster(OwnerName, ClusterType: string): string;
begin
  result := 'SELECT * FROM sys.all_clusters '
           +' where OWNER = '+str(OwnerName);
  if ClusterType <> '' then result := result +' and cluster_type = '+str(ClusterType);
end;

function GetClusterColumns(OwnerName, table_name: string): string;
begin
  result := 'SELECT * FROM sys.all_tab_columns '
           +'WHERE owner = '+Str(OwnerName)
           +'  and table_name = '+Str(table_name)
           +' ORDER BY column_id';
end;

end.
