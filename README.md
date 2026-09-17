# CRUD Product & Category — Spring Boot API + AJAX

## Cấu trúc project
```
src/main/java/vn/iotstar/
 ├── entity/          Category.java, Product.java
 ├── repository/      CategoryRepository.java, ProductRepository.java
 ├── model/           Response.java, ProductModel.java
 ├── service/         ICategoryService, CategoryServiceImpl,
 │                    IProductService, ProductServiceImpl,
 │                    IStorageService, FileSystemStorageServiceImpl
 ├── config/          StorageProperties.java, WebConfig.java
 ├── exception/       StorageException.java, StorageFileNotFoundException.java
 ├── controllers/api/ CategoryAPIController.java, ProductAPIController.java
 └── ShopApplication.java   (main class)

src/main/resources/application.properties   (cấu hình SQL Server)
src/main/webapp/admin/product-category-ajax.jsp  (giao diện CRUD AJAX)
sql/create_tables.sql                        (script tạo DB trên SSMS)
pom-dependencies.xml                         (dependency cần thêm vào pom.xml)
```

## Các bước triển khai trên Spring Tool Suite (STS)

Project này đã có sẵn `pom.xml` hoàn chỉnh — không cần tạo project mới bằng Spring
Starter Project, chỉ cần import trực tiếp:

1. **Giải nén file zip** vào một thư mục, ví dụ `C:\LTWEB\product-category-crud-spring\project`
   (thư mục này phải chứa `pom.xml` ở gốc — nếu bạn thấy khung "Projects" trống khi
   import nghĩa là bạn đang trỏ `Root Directory` vào thư mục cha chứ chưa đúng vào
   thư mục có `pom.xml`).

2. **Import vào STS**: File → Import → Maven → Existing Maven Projects → chọn đúng
   thư mục chứa `pom.xml` (thư mục `project` sau khi giải nén) → project sẽ hiện ra
   trong khung "Projects", tick chọn → Finish.

3. **Chạy script SQL trên SSMS**: mở SQL Server Management Studio, kết nối vào instance
   SQL Server, mở file `sql/create_tables.sql` và Execute để tạo database `ShopDB`
   cùng 2 bảng `Categories`, `Products` (có sẵn dữ liệu mẫu).

4. **Cấu hình `application.properties`**: sửa lại `username`, `password`, tên server/port
   cho khớp với SQL Server của bạn (mặc định `localhost:1433`, database `ShopDB`).

5. **Cập nhật Maven project**: chuột phải vào project → Maven → Update Project (Alt+F5)
   để STS tải các dependency trong `pom.xml` (cần có mạng để tải lần đầu).

6. **Chạy ứng dụng**: chuột phải vào project (hoặc vào `ShopApplication.java`) →
   Run As → Spring Boot App. Ứng dụng chạy tại `http://localhost:8080`.

7. **Kiểm tra API bằng Swagger**: `http://localhost:8080/swagger-ui.html`

8. **Kiểm tra giao diện AJAX**: `http://localhost:8080/admin/product-category-ajax.jsp`
   (project đã có sẵn `tomcat-embed-jasper` trong `pom.xml` để chạy JSP khi Run As
   Spring Boot App từ STS).

## Danh sách API

### Category — `/api/category`
| Method | Endpoint                  | Mô tả                          |
|--------|----------------------------|---------------------------------|
| GET    | /api/category              | Lấy tất cả category             |
| POST   | /api/category/getCategory  | Lấy 1 category theo `id`        |
| POST   | /api/category/addCategory  | Thêm category (`categoryName`, `icon`) |
| PUT    | /api/category/updateCategory | Cập nhật category (`categoryId`, `categoryName`, `icon`) |
| DELETE | /api/category/deleteCategory | Xóa category (`categoryId`)   |

### Product — `/api/product`
| Method | Endpoint                 | Mô tả                            |
|--------|---------------------------|-----------------------------------|
| GET    | /api/product               | Lấy tất cả product                |
| POST   | /api/product/getProduct    | Lấy 1 product theo `id`           |
| POST   | /api/product/addProduct    | Thêm product (`productName`, `imageFile`, `unitPrice`, `discount`, `description`, `categoryId`, `quantity`, `status`) |
| PUT    | /api/product/updateProduct | Cập nhật product (thêm `productId`) |
| DELETE | /api/product/deleteProduct | Xóa product (`productId`)         |

Ảnh upload được lưu vào thư mục `uploads/` (cấu hình trong `storage.location`)
và hiển thị qua đường dẫn `/uploads/<tên file>` (cấu hình trong `WebConfig.java`).

## Ghi chú
- File `product-category-ajax.jsp` là 1 trang độc lập, dùng Bootstrap 5 + jQuery AJAX,
  gọi thẳng các API trên để hiển thị bảng, thêm/sửa/xóa bằng modal — không cần load lại trang.
- Nếu project của bạn dùng sitemesh/layout (`admin.jsp`), có thể copy phần `<script>`,
  bảng và modal trong file này vào trang `admin.jsp`/`ajax.jsp` sẵn có của bạn.
