Flutter Lab 2 – Simple Mobile Calculator

Một ứng dụng máy tính đơn giản được xây dựng bằng Flutter, dựa trên thiết kế Figma được cung cấp trong bài Lab. Ứng dụng giúp bạn thực hành bố cục Flutter, quản lý trạng thái, xử lý phép toán và xây dựng giao diện tương tác.


 Giới thiệu

Dự án này là bài thực hành chương 2 (Lab 2) nhằm giúp sinh viên:

Hiểu cách tổ chức widget và bố cục trong Flutter

Quản lý trạng thái cho ứng dụng tương tác

Xử lý các phép toán số học cơ bản

Xây dựng UI theo Figma

Kiểm soát lỗi và các trường hợp đặc biệt

Viết mã sạch, có tổ chức và dễ bảo trì


Thiết kế (Figma)

Design link:
(giữ nguyên link từ tài liệu nếu bạn muốn)

Thông số UI theo Figma:

Primary color: #2D3142

Secondary: #4F5D75

Accent: #EF8354

Font: Roboto

Padding: 20px

Button spacing: 16px

Button border radius: 12px

Tính năng của ứng dụng

Hiển thị phép toán và kết quả theo thời gian thực

Các phép tính hỗ trợ:

Cộng (+)

Trừ (−)

Nhân (×)

Chia (÷)

Chức năng:

C – Xóa toàn bộ

CE – Xóa 1 ký tự cuối

± – Đổi dấu

% – Tính phần trăm

. – Thêm dấu thập phân


Các biến trạng thái chính
Biến	Mô tả
_display	Giá trị hiển thị hiện tại
_equation	Chuỗi phép toán đầy đủ
_num1	Toán hạng thứ nhất
_num2	Toán hạng thứ hai
_operation	Phép toán hiện tại



Các trường hợp đặc biệt cần xử lý

Chia cho 0

Nhập nhiều dấu .

Nhấn phép toán liên tiếp

Nhấn dấu = khi phép toán chưa hoàn chỉnh

Số quá dài → giới hạn ký tự hoặc scroll
