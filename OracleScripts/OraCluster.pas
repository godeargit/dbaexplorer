{
	DBAExplorer - Oracle Admin Management Tool
    Copyright (C) 2008  Alpaslan KILICKAYA

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
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
