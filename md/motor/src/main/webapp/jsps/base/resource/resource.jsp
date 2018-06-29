<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>资源表设置</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../assets/bootstrap-table/src/bootstrap-table.css">
  <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-treegrid/0.2.0/css/jquery.treegrid.min.css">
    <link rel="stylesheet" href="../../assets/examples.css">
	<script src="../../assets/jquery.min.js"></script>
    <script src="../../assets/bootstrap4/js/popper.min.js"></script>
    <script src="../../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../assets/bootstrap-table/src/bootstrap-table.js"></script>
    <script src="../../assets/bootstrap-table/src/extensions/treegrid/bootstrap-table-treegrid.js"></script>
<script src="https://cdn.bootcss.com/jquery-treegrid/0.2.0/js/jquery.treegrid.min.js"></script>

    <script src="../ga.js"></script>
</head>
<body>

    <div class="container">
        <h1>资源表设置</h1>
        <div id="toolbar">
        <button id="add" class="btn btn-default" disabled>
            <i class="glyphicon glyphicon-plus"></i> 增加
        </button>
        <button id="update" class="btn btn-default" disabled>
            <i class="glyphicon glyphicon-pencil"></i> 修改
        </button>
        <button id="remove" class="btn btn-default" disabled>
            <i class="glyphicon glyphicon-remove"></i> 删除
        </button>
    </div>
        <table id="table"
              data-toolbar="#toolbar"
               data-height="480"
               data-search="true"
               data-show-refresh="true"
           data-show-toggle="true"
           data-show-columns="true"
           data-show-footer=false
               data-url="data6.json"
               data-show-columns="false"
               data-side-pagination="server"
               data-id-field="id">
           
                <thead>
            <tr>
                <th data-field="state" data-checkbox="true"></th>
                <th data-field="resourceId" data-visible="false">资源表主键</th>
                <th data-field="resourceName">资源名</th>
                <th data-field="keyword">资源名简称</th>
                <th data-field="parentId" data-visible="false">上级功能点Id</th>
                <th data-field="parentName" data-visible="false">上级功能点名</th>
                <th data-field="resourceType">资源类型</th><!-- data-switchable="false" -->
                <th data-field="resourceUrl" >资源Url</th>
                <th data-field="code" >资源操作累计值</th>
                <th data-field="description">描述</th>
                <th data-field="index">序号</th>
                
            </tr>
            </thead>
        </table>
    </div>
  <script type="text/javascript">
  var  $remove = $('#remove'),$add=$('#add'),$update=$('#update');
  var $table=$('#table');
  var selections = [];
  $add.prop('disabled',false);
  $table.on('check.bs.table uncheck.bs.table ' +
          'check-all.bs.table uncheck-all.bs.table', function () {
      $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
      $update.prop('disabled', 1!=$table.bootstrapTable('getSelections').length);	
      // save your data, here just save the current page
      selections = getIdSelections();
      // push or splice the selections if you want to save all data selections
  });
  function getIdSelections() {
      return $.map($table.bootstrapTable('getSelections'), function (row) {
          return row.id
      });
  }
 
  $remove.click(function () {
      var ids = getIdSelections();
      $table.bootstrapTable('remove', {
          field: 'id',
          values: ids
      });
      $remove.prop('disabled', true);
  });
  $update.click(function () {
      alert($table.bootstrapTable('getSelections'));
  });
  $add.click(function () {
      alert($table.bootstrapTable('getSelections'));
  });
    $(function () {
    	  $table.bootstrapTable({
              striped: true,
              treeShowField: 'resourceName',
              parentIdField: 'pid',
              onLoadSuccess: function(data) {
                console.log('load');
                // jquery.treegrid.js
                $table.treegrid({
                  // initialState: 'collapsed',
                  treeColumn: 1,
                  // expanderExpandedClass: 'glyphicon glyphicon-minus',
                  // expanderCollapsedClass: 'glyphicon glyphicon-plus',
                  collapseAllRows:true,
                  onChange: function() {
                    $table.bootstrapTable('resetWidth');
                  }
                });
              }
          });
      });
    </script>
</body>
</html>










<!-- 

<!DOCTYPE html>
<html>
<head>
    <title>basic-columns</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../assets/bootstrap4/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/bootstrap-table/src/bootstrap-table.css">
    <link rel="stylesheet" href="../assets/examples.css">
<script src="../assets/jquery.min.js"></script>
    <script src="../assets/bootstrap4/js/popper.min.js"></script>
    <script src="../assets/bootstrap4/js/bootstrap.min.js"></script>
    <script src="../assets/bootstrap-table/src/bootstrap-table.js"></script>
    <script src="../ga.js"></script>
</head>
<body>
    <div class="container">
        <h1>Basic Columns</h1>
        <div id="toolbar">
        <button id="remove" class="btn btn-danger" disabled>
            <i class="glyphicon glyphicon-remove"></i> Delete
        </button>
    </div>
        <table id="table"
        	data-toolbar="#toolbar"
              data-toggle="table"
               data-height="480"
               data-search="true"
               data-show-refresh="true"
           data-show-toggle="true"
           data-show-columns="true"
           data-detail-view="true"
           
           data-show-pagination-switch="true"
           data-show-footer=false
               data-url="data5.json"
               data-show-columns="false"
               data-pagination="true"
               data-side-pagination="server"
               data-response-handler="responseHandler"
           data-detail-formatter="detailFormatter"
               data-page-list="[10, 25, 50, 100]"
               data-id-field="id">
            <thead>
            <tr>
            
                <th data-field="state"  data-checkbox="true"></th>
                <th data-field="name" data-switchable="false">Name</th>
                <th data-field="price">Price</th>
                <th data-field="column1">Columns1</th>
                <th data-field="column2" data-visible="false">Columns2</th>
                <th data-field="column3" data-switchable="false">Columns3</th>
                <th data-field="column4" data-visible="false">Columns4</th>
            </tr>
            </thead>
        </table>
    </div>
    
    <script type="text/javascript">
   var  $remove = $('#remove');
   	var $table=$('#table');
    var selections = [];
    $table.on('check.bs.table uncheck.bs.table ' +
            'check-all.bs.table uncheck-all.bs.table', function () {
        $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
		
        // save your data, here just save the current page
        selections = getIdSelections();
        alert(selections);
        // push or splice the selections if you want to save all data selections
    });
    function getIdSelections() {
        return $.map($table.bootstrapTable('getSelections'), function (row) {
            return row.id
        });
    }
    function detailFormatter(index, row) {
        var html = [];
        $.each(row, function (key, value) {
            html.push('<p><b>' + key + ':</b> ' + value + '</p>');
        });
		alert(html);
		alert(html.join(''));
        return html.join('');
    }
    $remove.click(function () {
        var ids = getIdSelections();
        $table.bootstrapTable('remove', {
            field: 'id',
            values: ids
        });
        $remove.prop('disabled', true);
    });
    
    function responseHandler(res) {
    	 $.each(res.rows, function (i, row) {
             row.state = $.inArray(row.id, selections) !== -1;
         });
        alert(JSON.stringify(res));
        return res;
    }
    </script>
    
    
</body>
</html> -->