<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Quản lý Category & Product</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
</head>
<body>
<div class="container-fluid mt-4">

	<h3>Danh mục (Category)</h3>
	<p><button class="btn btn-success" onclick="showCreateNewCategoryModal()">
		<i class="fas fa-plus"></i> Thêm Category</button></p>

	<table class="table table-striped table-bordered" id="tblCategory">
		<thead class="table-dark">
			<tr>
				<th>Id</th>
				<th>Icon</th>
				<th>Tên Category</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>

	<hr/>

	<h3>Sản phẩm (Product)</h3>
	<p><button class="btn btn-success" onclick="showCreateNewProductModal()">
		<i class="fas fa-plus"></i> Thêm Product</button></p>

	<table class="table table-striped table-bordered" id="tblProduct">
		<thead class="table-dark">
			<tr>
				<th>Id</th>
				<th>Ảnh</th>
				<th>Tên sản phẩm</th>
				<th>Số lượng</th>
				<th>Đơn giá</th>
				<th>Giảm giá</th>
				<th>Category</th>
				<th>Trạng thái</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
</div>

<div class="modal" tabindex="-1" id="createCategoryModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="addCategory" method="post" onsubmit="return false;" enctype="multipart/form-data">
				<div class="modal-header">
					<h5 class="modal-title">Thêm Category</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label class="form-label">Tên Category</label>
						<input type="text" class="form-control" id="new_categoryname" name="categoryName" required>
					</div>
					<div class="mb-3">
						<label class="form-label">Icon</label>
						<input type="file" class="form-control" id="new_icon" name="icon">
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Lưu</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal" tabindex="-1" id="updateCategoryModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="updateCategory" method="post" onsubmit="return false;" enctype="multipart/form-data">
				<div class="modal-header">
					<h5 class="modal-title">Cập nhật Category</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label class="form-label">Tên Category</label>
						<input type="text" class="form-control" id="categoryName_up" name="categoryName" required>
					</div>
					<div class="mb-3">
						<label class="form-label">Icon (để trống nếu không đổi)</label>
						<input type="file" class="form-control" id="icon_up" name="icon">
					</div>
					<input type="hidden" id="categoryId_up" name="categoryId">
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Cập nhật</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal" tabindex="-1" id="createProductModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="addProduct" method="post" onsubmit="return false;" enctype="multipart/form-data">
				<div class="modal-header">
					<h5 class="modal-title">Thêm Product</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label class="form-label">Tên sản phẩm</label>
						<input type="text" class="form-control" name="productName" required>
					</div>
					<div class="mb-3">
						<label class="form-label">Ảnh</label>
						<input type="file" class="form-control" name="imageFile">
					</div>
					<div class="row">
						<div class="col mb-3">
							<label class="form-label">Số lượng</label>
							<input type="number" class="form-control" name="quantity" value="0" required>
						</div>
						<div class="col mb-3">
							<label class="form-label">Đơn giá</label>
							<input type="number" step="0.01" class="form-control" name="unitPrice" value="0" required>
						</div>
						<div class="col mb-3">
							<label class="form-label">Giảm giá</label>
							<input type="number" step="0.01" class="form-control" name="discount" value="0" required>
						</div>
					</div>
					<div class="mb-3">
						<label class="form-label">Mô tả</label>
						<textarea class="form-control" name="description" required></textarea>
					</div>
					<div class="mb-3">
						<label class="form-label">Category</label>
						<select class="form-control" name="categoryId" id="add_categoryId" required></select>
					</div>
					<div class="mb-3">
						<label class="form-label">Trạng thái</label>
						<select class="form-control" name="status">
							<option value="1">Đang bán</option>
							<option value="0">Ngừng bán</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Lưu</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal" tabindex="-1" id="updateProductModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="updateProduct" method="post" onsubmit="return false;" enctype="multipart/form-data">
				<div class="modal-header">
					<h5 class="modal-title">Cập nhật Product</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<input type="hidden" name="productId" id="productId_up">
					<div class="mb-3">
						<label class="form-label">Tên sản phẩm</label>
						<input type="text" class="form-control" name="productName" id="productName_up" required>
					</div>
					<div class="mb-3">
						<label class="form-label">Ảnh (để trống nếu không đổi)</label>
						<input type="file" class="form-control" name="imageFile">
					</div>
					<div class="row">
						<div class="col mb-3">
							<label class="form-label">Số lượng</label>
							<input type="number" class="form-control" name="quantity" id="quantity_up" required>
						</div>
						<div class="col mb-3">
							<label class="form-label">Đơn giá</label>
							<input type="number" step="0.01" class="form-control" name="unitPrice" id="unitPrice_up" required>
						</div>
						<div class="col mb-3">
							<label class="form-label">Giảm giá</label>
							<input type="number" step="0.01" class="form-control" name="discount" id="discount_up" required>
						</div>
					</div>
					<div class="mb-3">
						<label class="form-label">Mô tả</label>
						<textarea class="form-control" name="description" id="description_up" required></textarea>
					</div>
					<div class="mb-3">
						<label class="form-label">Category</label>
						<select class="form-control" name="categoryId" id="update_categoryId" required></select>
					</div>
					<div class="mb-3">
						<label class="form-label">Trạng thái</label>
						<select class="form-control" name="status" id="status_up">
							<option value="1">Đang bán</option>
							<option value="0">Ngừng bán</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Cập nhật</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

var categoryModalAdd, categoryModalUpdate, productModalAdd, productModalUpdate;

$(document).ready(function() {
	categoryModalAdd = new bootstrap.Modal(document.getElementById('createCategoryModal'));
	categoryModalUpdate = new bootstrap.Modal(document.getElementById('updateCategoryModal'));
	productModalAdd = new bootstrap.Modal(document.getElementById('createProductModal'));
	productModalUpdate = new bootstrap.Modal(document.getElementById('updateProductModal'));

	loadCategories();
	loadProducts();
});

function loadCategories() {
	$.getJSON(contextPath + '/api/category', function(res) {
		var list = res.body;
		var tr = [];
		var options = '<option value="">-- Chọn category --</option>';
		for (var i = 0; i < list.length; i++) {
			var c = list[i];
			tr.push('<tr>');
			tr.push('<td>' + c.categoryId + '</td>');
			tr.push('<td>' + (c.icon ? '<img src="' + contextPath + '/uploads/' + c.icon + '" style="width:60px" class="img-fluid">' : '') + '</td>');
			tr.push('<td>' + c.categoryName + '</td>');
			tr.push('<td>'
				+ '<button class="btn btn-outline-warning btn-sm" onclick="showEditCategoryModal(' + c.categoryId + ',\'' + c.categoryName.replace(/'/g,"\\'") + '\')"><i class="fa fa-edit"></i></button> '
				+ '<button class="btn btn-outline-danger btn-sm" onclick="deleteCategory(' + c.categoryId + ')"><i class="fa fa-trash"></i></button>'
				+ '</td>');
			tr.push('</tr>');
			options += '<option value="' + c.categoryId + '">' + c.categoryName + '</option>';
		}
		$('#tblCategory tbody').html(tr.join(''));
		$('#add_categoryId, #update_categoryId').html(options);
	});
}

function showCreateNewCategoryModal() {
	$('#addCategory')[0].reset();
	categoryModalAdd.show();
}

$("form#addCategory").submit(function(e) {
	e.preventDefault();
	var formData = new FormData(this);
	$.ajax({
		url: contextPath + '/api/category/addCategory',
		type: 'POST',
		data: formData,
		dataType: 'json',
		cache: false,
		contentType: false,
		processData: false,
		success: function(res) {
			categoryModalAdd.hide();
			loadCategories();
		},
		error: function(xhr) {
			alert('Lỗi: ' + xhr.responseText);
		}
	});
});

function showEditCategoryModal(categoryId, categoryName) {
	$('#categoryId_up').val(categoryId);
	$('#categoryName_up').val(categoryName);
	$('#icon_up').val('');
	categoryModalUpdate.show();
}

$("form#updateCategory").submit(function(e) {
	e.preventDefault();
	var formData = new FormData(this);
	$.ajax({
		url: contextPath + '/api/category/updateCategory',
		type: 'PUT',
		data: formData,
		dataType: 'json',
		cache: false,
		contentType: false,
		processData: false,
		success: function(res) {
			categoryModalUpdate.hide();
			loadCategories();
		},
		error: function(xhr) {
			alert('Lỗi: ' + xhr.responseText);
		}
	});
});

function deleteCategory(categoryId) {
	if (!confirm('Bạn có chắc muốn xóa Category này?')) return;
	$.ajax({
		url: contextPath + '/api/category/deleteCategory?categoryId=' + categoryId,
		type: 'DELETE',
		dataType: 'json',
		success: function() {
			loadCategories();
			loadProducts();
		},
		error: function(xhr) {
			var msg = 'Có lỗi xảy ra';
			try { msg = JSON.parse(xhr.responseText).message; } catch (e) {}
			alert('Lỗi: ' + msg);
		}
	});
}

function loadProducts() {
	$.getJSON(contextPath + '/api/product', function(res) {
		var list = res.body;
		var tr = [];
		for (var i = 0; i < list.length; i++) {
			var p = list[i];
			var cateName = p.category ? p.category.categoryName : '';
			var cateId = p.category ? p.category.categoryId : '';
			tr.push('<tr>');
			tr.push('<td>' + p.productId + '</td>');
			tr.push('<td>' + (p.images ? '<img src="' + contextPath + '/uploads/' + p.images + '" style="width:60px" class="img-fluid">' : '') + '</td>');
			tr.push('<td>' + p.productName + '</td>');
			tr.push('<td>' + p.quantity + '</td>');
			tr.push('<td>' + p.unitPrice + '</td>');
			tr.push('<td>' + p.discount + '</td>');
			tr.push('<td>' + cateName + '</td>');
			tr.push('<td>' + (p.status == 1 ? 'Đang bán' : 'Ngừng bán') + '</td>');
			tr.push('<td>'
				+ '<button class="btn btn-outline-warning btn-sm" onclick=\'showEditProductModal(' + JSON.stringify(p) + ')\'><i class="fa fa-edit"></i></button> '
				+ '<button class="btn btn-outline-danger btn-sm" onclick="deleteProduct(' + p.productId + ')"><i class="fa fa-trash"></i></button>'
				+ '</td>');
			tr.push('</tr>');
		}
		$('#tblProduct tbody').html(tr.join(''));
	});
}

function showCreateNewProductModal() {
	$('#addProduct')[0].reset();
	productModalAdd.show();
}

$("form#addProduct").submit(function(e) {
	e.preventDefault();
	var formData = new FormData(this);
	$.ajax({
		url: contextPath + '/api/product/addProduct',
		type: 'POST',
		data: formData,
		dataType: 'json',
		cache: false,
		contentType: false,
		processData: false,
		success: function(res) {
			productModalAdd.hide();
			loadProducts();
		},
		error: function(xhr) {
			alert('Lỗi: ' + xhr.responseText);
		}
	});
});

function showEditProductModal(p) {
	$('#productId_up').val(p.productId);
	$('#productName_up').val(p.productName);
	$('#quantity_up').val(p.quantity);
	$('#unitPrice_up').val(p.unitPrice);
	$('#discount_up').val(p.discount);
	$('#description_up').val(p.description);
	$('#status_up').val(p.status);
	$('#update_categoryId').val(p.category ? p.category.categoryId : '');
	productModalUpdate.show();
}

$("form#updateProduct").submit(function(e) {
	e.preventDefault();
	var formData = new FormData(this);
	$.ajax({
		url: contextPath + '/api/product/updateProduct',
		type: 'PUT',
		data: formData,
		dataType: 'json',
		cache: false,
		contentType: false,
		processData: false,
		success: function(res) {
			productModalUpdate.hide();
			loadProducts();
		},
		error: function(xhr) {
			alert('Lỗi: ' + xhr.responseText);
		}
	});
});

function deleteProduct(productId) {
	if (!confirm('Bạn có chắc muốn xóa Product này?')) return;
	$.ajax({
		url: contextPath + '/api/product/deleteProduct?productId=' + productId,
		type: 'DELETE',
		dataType: 'json',
		success: function() {
			loadProducts();
		},
		error: function(xhr) {
			alert('Lỗi: ' + xhr.responseText);
		}
	});
}
</script>
</body>
</html>
