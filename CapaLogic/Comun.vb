Imports System.Reflection
Public Module Comun

    Public Function ConvertDataTableToList(Of T)(dt As DataTable) As IList
        Dim data As List(Of T) = New List(Of T)
        For Each row As DataRow In dt.Rows
            Dim item As T = GetItem(Of T)(row)
            data.Add(item)
        Next

        Return data
    End Function
    Private Function GetItem(Of T)(ByVal dr As DataRow) As T
        Dim temp As Type = GetType(T)
        Dim obj As T = Activator.CreateInstance(Of T)()
        For Each column As DataColumn In dr.Table.Columns
            For Each pro As PropertyInfo In temp.GetProperties()
                If pro.Name.ToUpper() = column.ColumnName.ToUpper() Then
                    pro.SetValue(obj, dr(column.ColumnName), Nothing)
                Else
                    Continue For
                End If
            Next
        Next
        Return obj
    End Function
    '    Private Static List<T> ConvertDataTable<T>(DataTable dt)  
    '{  
    '    List<T> data = New List<T>();  
    '    foreach (DataRow row in dt.Rows)  
    '    {  
    '        T item = GetItem < T > (row);  
    '        data.Add(item);  
    '    }  
    '    Return data;  
    '}  
    'Private Static T GetItem<T>(DataRow dr)  
    '{  
    '    Type temp = TypeOf(T);  
    '    T obj = Activator.CreateInstance < T > ();  

    '    foreach (DataColumn column in dr.Table.Columns)  
    '    {  
    '        foreach (PropertyInfo pro in temp.GetProperties())  
    '        {  
    '            If (pro.Name == column.ColumnName)
    '                pro.SetValue(obj, dr[column.ColumnName], null);  
    '            Else
    '    Continue Do;  
    '        }  
    '    }  
    '    Return obj;  
    '}  
End Module
