/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100427
 Source Host           : localhost:3306
 Source Schema         : datn

 Target Server Type    : MySQL
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 21/03/2024 22:07:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ctdonhang
-- ----------------------------
DROP TABLE IF EXISTS `ctdonhang`;
CREATE TABLE `ctdonhang`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SoLuong` int NULL DEFAULT NULL,
  `Gia` int NULL DEFAULT NULL,
  `IDSanPham` int NULL DEFAULT NULL,
  `IDDonHang` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `CTDonHang_SanPham_IDSanPham`(`IDSanPham`) USING BTREE,
  INDEX `CTDonHang_DonHang_IDDonHang`(`IDDonHang`) USING BTREE,
  CONSTRAINT `CTDonHang_DonHang_IDDonHang` FOREIGN KEY (`IDDonHang`) REFERENCES `donhang` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CTDonHang_SanPham_IDSanPham` FOREIGN KEY (`IDSanPham`) REFERENCES `sanpham` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ctdonhang
-- ----------------------------
INSERT INTO `ctdonhang` VALUES (1, 2, 15250000, 1, 1);
INSERT INTO `ctdonhang` VALUES (2, 5, 14250000, 2, 2);
INSERT INTO `ctdonhang` VALUES (3, 2, 13450000, 4, 3);
INSERT INTO `ctdonhang` VALUES (4, 1, 17545000, 5, 4);
INSERT INTO `ctdonhang` VALUES (5, 1, 13500000, 7, 5);
INSERT INTO `ctdonhang` VALUES (7, 4, 15250000, 1, 1);
INSERT INTO `ctdonhang` VALUES (8, 7, 14250000, 2, 3);
INSERT INTO `ctdonhang` VALUES (9, 1, 14250000, 2, 9);
INSERT INTO `ctdonhang` VALUES (10, 1, 9750000, 6, 9);
INSERT INTO `ctdonhang` VALUES (11, 1, 14000000, 7, 9);
INSERT INTO `ctdonhang` VALUES (12, 2, 11437500, 1, 9);
INSERT INTO `ctdonhang` VALUES (13, 1, 11437500, 1, 10);
INSERT INTO `ctdonhang` VALUES (14, 2, 14250000, 2, 10);
INSERT INTO `ctdonhang` VALUES (15, 3, 10760000, 3, 10);
INSERT INTO `ctdonhang` VALUES (16, 1, 8772500, 4, 10);
INSERT INTO `ctdonhang` VALUES (17, 3, 9750000, 20, 11);
INSERT INTO `ctdonhang` VALUES (18, 1, 8100000, 5, 11);
INSERT INTO `ctdonhang` VALUES (19, 1, 14250000, 2, 12);
INSERT INTO `ctdonhang` VALUES (20, 1, 10760000, 30, 12);
INSERT INTO `ctdonhang` VALUES (21, 4, 32340000, 51, 13);
INSERT INTO `ctdonhang` VALUES (22, 3, 5421500, 49, 13);
INSERT INTO `ctdonhang` VALUES (23, 1, 43590000, 47, 14);
INSERT INTO `ctdonhang` VALUES (24, 1, 5421500, 49, 15);
INSERT INTO `ctdonhang` VALUES (25, 1, 22690000, 50, 18);
INSERT INTO `ctdonhang` VALUES (26, 1, 5421500, 49, 18);
INSERT INTO `ctdonhang` VALUES (27, 1, 27090000, 18, 18);
INSERT INTO `ctdonhang` VALUES (28, 1, 23190000, 17, 18);
INSERT INTO `ctdonhang` VALUES (29, 1, 22690000, 50, 19);
INSERT INTO `ctdonhang` VALUES (30, 1, 10390000, 48, 19);
INSERT INTO `ctdonhang` VALUES (31, 2, 27090000, 18, 19);
INSERT INTO `ctdonhang` VALUES (32, 1, 10390000, 48, 20);
INSERT INTO `ctdonhang` VALUES (33, 1, 5421500, 49, 21);
INSERT INTO `ctdonhang` VALUES (34, 1, 22690000, 50, 21);
INSERT INTO `ctdonhang` VALUES (35, 8, 14090000, 38, 22);
INSERT INTO `ctdonhang` VALUES (36, 5, 8590000, 40, 22);
INSERT INTO `ctdonhang` VALUES (37, 1, 32340000, 51, 23);
INSERT INTO `ctdonhang` VALUES (38, 1, 22690000, 50, 23);
INSERT INTO `ctdonhang` VALUES (50, 1, 43590000, 47, 49);
INSERT INTO `ctdonhang` VALUES (51, 3, 17390000, 46, 49);
INSERT INTO `ctdonhang` VALUES (52, 3, 20390000, 45, 49);
INSERT INTO `ctdonhang` VALUES (53, 1, 12990000, 44, 49);
INSERT INTO `ctdonhang` VALUES (54, 2, 22690000, 50, 50);
INSERT INTO `ctdonhang` VALUES (55, 2, 10390000, 48, 50);
INSERT INTO `ctdonhang` VALUES (85, 1, 22690000, 50, 50);
INSERT INTO `ctdonhang` VALUES (86, 1, 8100000, 5, 50);
INSERT INTO `ctdonhang` VALUES (87, 2, 10390000, 48, 50);
INSERT INTO `ctdonhang` VALUES (88, 2, 5421500, 49, 50);
INSERT INTO `ctdonhang` VALUES (89, 1, 43590000, 47, 50);
INSERT INTO `ctdonhang` VALUES (143, 2, 5421500, 49, 59);
INSERT INTO `ctdonhang` VALUES (144, 1, 10390000, 48, 59);
INSERT INTO `ctdonhang` VALUES (145, 2, 5421500, 49, 60);
INSERT INTO `ctdonhang` VALUES (146, 1, 10390000, 48, 60);

-- ----------------------------
-- Table structure for cthoadonnhap
-- ----------------------------
DROP TABLE IF EXISTS `cthoadonnhap`;
CREATE TABLE `cthoadonnhap`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SoLuong` int NULL DEFAULT NULL,
  `Gia` int NULL DEFAULT NULL,
  `IDSanPham` int NULL DEFAULT NULL,
  `IDHoaDonNhap` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `CTHoaDonNhap_SanPham_IDSanPham`(`IDSanPham`) USING BTREE,
  INDEX `CTHoaDonNhap_HoaDonNhap_IDHoaDonNhap`(`IDHoaDonNhap`) USING BTREE,
  CONSTRAINT `CTHoaDonNhap_HoaDonNhap_IDHoaDonNhap` FOREIGN KEY (`IDHoaDonNhap`) REFERENCES `hoadonnhap` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CTHoaDonNhap_SanPham_IDSanPham` FOREIGN KEY (`IDSanPham`) REFERENCES `sanpham` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cthoadonnhap
-- ----------------------------
INSERT INTO `cthoadonnhap` VALUES (1, 30, 15250000, 1, 1);
INSERT INTO `cthoadonnhap` VALUES (2, 40, 14250000, 2, 2);
INSERT INTO `cthoadonnhap` VALUES (3, 60, 13450000, 3, 3);
INSERT INTO `cthoadonnhap` VALUES (4, 87, 17545000, 4, 4);
INSERT INTO `cthoadonnhap` VALUES (5, 46, 13500000, 5, 5);
INSERT INTO `cthoadonnhap` VALUES (6, 23, 15000000, 6, 6);
INSERT INTO `cthoadonnhap` VALUES (7, 57, 14000000, 7, 7);
INSERT INTO `cthoadonnhap` VALUES (9, 30, 8190000, 9, 1);
INSERT INTO `cthoadonnhap` VALUES (10, 20, 13450000, 10, 2);
INSERT INTO `cthoadonnhap` VALUES (11, 20, 17545000, 11, 3);
INSERT INTO `cthoadonnhap` VALUES (12, 20, 17545000, 12, 4);
INSERT INTO `cthoadonnhap` VALUES (15, 50, 90000000, 50, 18);
INSERT INTO `cthoadonnhap` VALUES (16, 71, 78000000, 46, 18);

-- ----------------------------
-- Table structure for ctkho
-- ----------------------------
DROP TABLE IF EXISTS `ctkho`;
CREATE TABLE `ctkho`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SoLuong` int NULL DEFAULT NULL,
  `IDSanPham` int NULL DEFAULT NULL,
  `IDKho` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `CTKho_SanPham_IDSanPham`(`IDSanPham`) USING BTREE,
  INDEX `CTKho_Kho_IDKho`(`IDKho`) USING BTREE,
  CONSTRAINT `CTKho_Kho_IDKho` FOREIGN KEY (`IDKho`) REFERENCES `kho` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CTKho_SanPham_IDSanPham` FOREIGN KEY (`IDSanPham`) REFERENCES `sanpham` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ctkho
-- ----------------------------
INSERT INTO `ctkho` VALUES (1, 50, 1, 1);
INSERT INTO `ctkho` VALUES (2, 67, 2, 1);
INSERT INTO `ctkho` VALUES (3, 55, 3, 1);
INSERT INTO `ctkho` VALUES (4, 100, 4, 1);
INSERT INTO `ctkho` VALUES (5, 120, 5, 2);
INSERT INTO `ctkho` VALUES (6, 78, 6, 2);
INSERT INTO `ctkho` VALUES (7, 95, 7, 2);
INSERT INTO `ctkho` VALUES (8, 70, 8, 3);
INSERT INTO `ctkho` VALUES (9, 50, 9, 3);
INSERT INTO `ctkho` VALUES (10, 40, 10, 3);
INSERT INTO `ctkho` VALUES (11, 40, 1, 2);
INSERT INTO `ctkho` VALUES (12, 40, 11, 2);
INSERT INTO `ctkho` VALUES (13, 40, 12, 2);
INSERT INTO `ctkho` VALUES (14, 50, 13, 1);
INSERT INTO `ctkho` VALUES (16, 45, 14, 2);
INSERT INTO `ctkho` VALUES (17, 64, 15, 3);
INSERT INTO `ctkho` VALUES (18, 75, 16, 4);
INSERT INTO `ctkho` VALUES (19, 46, 17, 5);
INSERT INTO `ctkho` VALUES (20, 35, 18, 1);
INSERT INTO `ctkho` VALUES (21, 47, 19, 2);
INSERT INTO `ctkho` VALUES (22, 28, 20, 3);
INSERT INTO `ctkho` VALUES (23, 46, 21, 5);
INSERT INTO `ctkho` VALUES (24, 28, 22, 5);
INSERT INTO `ctkho` VALUES (25, 57, 24, 3);
INSERT INTO `ctkho` VALUES (26, 50, 25, 4);
INSERT INTO `ctkho` VALUES (27, 57, 25, 1);
INSERT INTO `ctkho` VALUES (28, 29, 26, 2);
INSERT INTO `ctkho` VALUES (29, 57, 27, 3);
INSERT INTO `ctkho` VALUES (30, 39, 28, 4);
INSERT INTO `ctkho` VALUES (31, 55, 30, 4);
INSERT INTO `ctkho` VALUES (32, 29, 32, 3);
INSERT INTO `ctkho` VALUES (33, 48, 33, 5);
INSERT INTO `ctkho` VALUES (34, 49, 34, 5);
INSERT INTO `ctkho` VALUES (35, 38, 35, 5);
INSERT INTO `ctkho` VALUES (36, 37, 35, 1);
INSERT INTO `ctkho` VALUES (37, 54, 36, 2);
INSERT INTO `ctkho` VALUES (38, 35, 37, 3);
INSERT INTO `ctkho` VALUES (39, 36, 38, 4);
INSERT INTO `ctkho` VALUES (40, 46, 40, 5);
INSERT INTO `ctkho` VALUES (41, 27, 41, 3);
INSERT INTO `ctkho` VALUES (42, 47, 42, 4);
INSERT INTO `ctkho` VALUES (43, 53, 43, 4);
INSERT INTO `ctkho` VALUES (44, 64, 44, 5);
INSERT INTO `ctkho` VALUES (45, 35, 45, 1);
INSERT INTO `ctkho` VALUES (46, 46, 46, 5);
INSERT INTO `ctkho` VALUES (47, 42, 47, 4);
INSERT INTO `ctkho` VALUES (48, 47, 48, 3);
INSERT INTO `ctkho` VALUES (49, 37, 49, 4);
INSERT INTO `ctkho` VALUES (50, 74, 50, 2);
INSERT INTO `ctkho` VALUES (51, 46, 51, 4);
INSERT INTO `ctkho` VALUES (52, 66, 29, 1);
INSERT INTO `ctkho` VALUES (53, 35, 31, 2);
INSERT INTO `ctkho` VALUES (54, 47, 39, 3);
INSERT INTO `ctkho` VALUES (55, 50, 50, 5);
INSERT INTO `ctkho` VALUES (56, 71, 46, 5);
INSERT INTO `ctkho` VALUES (61, 111, 50, 5);
INSERT INTO `ctkho` VALUES (62, 111, 44, 5);
INSERT INTO `ctkho` VALUES (63, 123, 50, 5);
INSERT INTO `ctkho` VALUES (64, 123, 51, 5);
INSERT INTO `ctkho` VALUES (65, 444, 50, 5);

-- ----------------------------
-- Table structure for dieukhoan
-- ----------------------------
DROP TABLE IF EXISTS `dieukhoan`;
CREATE TABLE `dieukhoan`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NoiDung` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Kieu` int NULL DEFAULT NULL,
  `TrangThai` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dieukhoan
-- ----------------------------
INSERT INTO `dieukhoan` VALUES (1, 'Galio là trang thương mại điện tử nơi cung cấp các sản phẩm và dịch vụ. Việc sử dụng trang web này đồng nghĩa với việc bạn chấp nhận và tuân thủ các điều khoản và điều kiện sau đây.', 1, 1);
INSERT INTO `dieukhoan` VALUES (2, 'Khi có vấn đề về đơn hàng, sản phẩm, hoặc cần hỗ trợ, bạn có thể liên hệ với tổng đài Galio qua hotline 0906090112 hoặc chat trực tuyến thông qua trang web Galio.com.', 1, 1);
INSERT INTO `dieukhoan` VALUES (3, 'Bằng cách gọi điện đến hotline 0906090112, bạn có thể đặt hàng trực tiếp và được hướng dẫn chi tiết về quy trình mua hàng.', 1, 1);
INSERT INTO `dieukhoan` VALUES (4, 'Sử dụng Messenger trực tuyến trên trang Galio.com để trò chuyện với nhân viên hỗ trợ. Chat trực tuyến không mất cước phí và là lựa chọn thuận tiện.', 1, 1);
INSERT INTO `dieukhoan` VALUES (5, 'Mặc dù không bắt buộc, việc tạo tài khoản Galio mang lại nhiều lợi ích. Bạn có thể theo dõi đơn hàng, đổi trả sản phẩm, và nhận ưu đãi mã giảm giá. Việc tạo tài khoản là miễn phí.', 1, 1);
INSERT INTO `dieukhoan` VALUES (6, 'Nếu bạn gặp vấn đề về sản phẩm như hàng giả, nhái, hoặc đơn hàng không đúng, hãy liên hệ ngay với tổng đài Galio để nhận sự hỗ trợ. Quy trình đổi trả cần được thực hiện trong khoảng thời gian 24 giờ kể từ khi nhận đơn.', 1, 1);
INSERT INTO `dieukhoan` VALUES (7, 'Đối với sản phẩm có lỗi kỹ thuật, liên hệ với tổng đài Galio để được hướng dẫn về quy trình bảo hành. Bạn cũng có thể gọi để kích hoạt bảo hành điện tử cho các sản phẩm như tivi, máy lạnh, laptop, và các sản phẩm khác.', 1, 1);
INSERT INTO `dieukhoan` VALUES (8, 'Tổng đài Galio hoạt động từ 9h đến 18h vào các ngày trong tuần, kể cả Thứ Bảy và Chủ Nhật, trừ ngày lễ.', 1, 1);
INSERT INTO `dieukhoan` VALUES (9, 'Galio không chịu trách nhiệm đối với mất mát hoặc thiệt hại phát sinh từ việc sử dụng trang web hoặc sản phẩm mua từ Galio.', 1, 1);
INSERT INTO `dieukhoan` VALUES (10, 'Galio có quyền thay đổi các điều khoản dịch vụ mà không cần thông báo trước. Việc sử dụng trang web sau khi có sự thay đổi đồng nghĩa với việc bạn chấp nhận các điều khoản mới.', 1, 1);
INSERT INTO `dieukhoan` VALUES (11, 'Galio cam kết cung cấp dịch vụ đổi trả linh hoạt và công bằng cho khách hàng. Quy định này áp dụng cho tất cả các sản phẩm được mua từ trang thương mại điện tử Galio.', 2, 1);
INSERT INTO `dieukhoan` VALUES (12, 'Khách hàng có quyền đổi trả sản phẩm trong khoảng thời gian 30 ngày kể từ khi nhận được đơn hàng. Để đảm bảo quá trình đổi trả diễn ra thuận lợi, khách hàng nên liên hệ ngay với tổng đài Galio.', 2, 1);
INSERT INTO `dieukhoan` VALUES (13, 'Để yêu cầu đổi trả sản phẩm, khách hàng cần cung cấp thông tin đầy đủ và chính xác về lý do đổi trả, số đơn hàng, và thông tin liên hệ. Thông tin chi tiết hơn có thể được yêu cầu tùy theo tình trạng cụ thể của sản phẩm.', 2, 1);
INSERT INTO `dieukhoan` VALUES (14, 'Sản phẩm cần được trả lại trong tình trạng mới và không bị hỏng, có đầy đủ phụ kiện và bao bì gốc. Galio giữ quyền từ chối đổi trả nếu sản phẩm không đáp ứng các yêu cầu này.', 2, 1);
INSERT INTO `dieukhoan` VALUES (15, 'Khách hàng sẽ chịu trách nhiệm về các chi phí liên quan đến việc đổi trả sản phẩm, bao gồm cả chi phí vận chuyển. Galio không chịu trách nhiệm về bất kỳ chi phí nào phát sinh trong quá trình vận chuyển đổi trả.', 2, 1);
INSERT INTO `dieukhoan` VALUES (16, 'Sau khi nhận được sản phẩm đổi trả, Galio sẽ kiểm tra tình trạng của sản phẩm và xử lý theo yêu cầu của khách hàng. Quá trình này có thể mất một khoảng thời gian nhất định và khách hàng sẽ được thông báo về kết quả.', 2, 1);
INSERT INTO `dieukhoan` VALUES (17, 'Đối với các sản phẩm có lỗi kỹ thuật, khách hàng nên liên hệ với tổng đài Galio để được hướng dẫn về quy trình bảo hành. Galio cam kết hỗ trợ khách hàng trong việc kích hoạt bảo hành điện tử cho các sản phẩm có lỗi kỹ thuật.', 2, 1);
INSERT INTO `dieukhoan` VALUES (18, 'Để yêu cầu đổi trả hoặc biết thêm chi tiết, khách hàng có thể liên hệ với tổng đài Galio qua hotline 19001007 hoặc sử dụng các kênh liên lạc khác như chat trực tuyến trên trang web.', 2, 1);
INSERT INTO `dieukhoan` VALUES (19, 'Galio có quyền thay đổi các điều khoản đổi trả mà không cần thông báo trước. Việc sử dụng dịch vụ đổi trả sau khi có sự thay đổi đồng nghĩa với việc bạn chấp nhận các điều khoản mới.', 2, 1);
INSERT INTO `dieukhoan` VALUES (20, 'Galio cam kết cung cấp dịch vụ bảo hành chất lượng và minh bạch cho khách hàng. Quy định này áp dụng cho tất cả các sản phẩm được mua từ trang thương mại điện tử Galio.', 3, 1);
INSERT INTO `dieukhoan` VALUES (21, 'Thời gian bảo hành cho các sản phẩm Galio được xác định rõ trên trang thông tin sản phẩm và/hoặc trên hóa đơn mua hàng. Khách hàng được hưởng quyền lợi bảo hành trong khoảng thời gian quy định.', 3, 1);
INSERT INTO `dieukhoan` VALUES (22, 'Để yêu cầu bảo hành, khách hàng cần cung cấp thông tin đầy đủ và chính xác về số đơn hàng, thông tin liên hệ, và mô tả chi tiết về vấn đề kỹ thuật của sản phẩm.', 3, 1);
INSERT INTO `dieukhoan` VALUES (23, 'Sản phẩm cần được bảo quản và sử dụng đúng cách theo hướng dẫn của nhà sản xuất. Galio giữ quyền từ chối bảo hành nếu sản phẩm có dấu hiệu của việc sử dụng sai cách, sửa chữa không đúng cách, hoặc không đáp ứng các điều kiện bảo hành.', 3, 1);
INSERT INTO `dieukhoan` VALUES (24, 'Trong thời gian bảo hành, các chi phí liên quan đến việc sửa chữa và thay thế linh kiện sẽ được Galio chịu trách nhiệm, trừ trường hợp sản phẩm bị hỏng do sử dụng không đúng cách từ phía khách hàng.', 3, 1);
INSERT INTO `dieukhoan` VALUES (25, 'Khách hàng nên liên hệ trực tiếp với tổng đài Galio để được hướng dẫn về quy trình bảo hành. Trong quá trình này, khách hàng có thể được yêu cầu cung cấp chứng minh mua hàng và các thông tin khác liên quan.', 3, 1);
INSERT INTO `dieukhoan` VALUES (26, 'Galio cam kết xử lý yêu cầu bảo hành của khách hàng trong thời gian ngắn nhất có thể. Thời gian xử lý cụ thể có thể phụ thuộc vào tình trạng cụ thể của sản phẩm và yêu cầu bảo hành.', 3, 1);
INSERT INTO `dieukhoan` VALUES (27, 'Đối với các sản phẩm có yêu cầu bảo hành điện tử, khách hàng có thể liên hệ trực tiếp với tổng đài Galio để được hướng dẫn về cách kích hoạt bảo hành.', 3, 1);
INSERT INTO `dieukhoan` VALUES (28, 'Để biết thêm chi tiết về quy định bảo hành hoặc yêu cầu bảo hành, khách hàng có thể liên hệ với tổng đài Galio qua hotline 0906090112 hoặc sử dụng các kênh liên lạc khác như chat trực tuyến trên trang web.', 3, 1);
INSERT INTO `dieukhoan` VALUES (29, 'Galio có quyền thay đổi các điều khoản bảo hành mà không cần thông báo trước. Việc sử dụng dịch vụ bảo hành sau khi có sự thay đổi đồng nghĩa với việc bạn chấp nhận các điều khoản mới.', 3, 1);
INSERT INTO `dieukhoan` VALUES (30, 'rung tâm bảo hành của Galio được tạo ra với mục đích cung cấp dịch vụ hỗ trợ sau bán hàng chất lượng và đáp ứng nhanh chóng các yêu cầu bảo hành từ phía khách hàng.', 4, 1);
INSERT INTO `dieukhoan` VALUES (31, 'Trung tâm bảo hành của Galio cung cấp các dịch vụ như sửa chữa, thay thế linh kiện, và bảo dưỡng đối với các sản phẩm mà Galio bán ra.', 4, 1);
INSERT INTO `dieukhoan` VALUES (32, 'Khách hàng có thể liên hệ trực tiếp với trung tâm bảo hành của Galio qua các kênh thông tin được cung cấp, bao gồm hotline, email, và địa chỉ trung tâm.', 4, 1);
INSERT INTO `dieukhoan` VALUES (33, 'Để yêu cầu bảo hành, khách hàng cần cung cấp thông tin đầy đủ và chính xác về số đơn hàng, mô tả chi tiết về vấn đề kỹ thuật của sản phẩm, và thông tin liên hệ.', 4, 1);
INSERT INTO `dieukhoan` VALUES (34, 'Sau khi nhận yêu cầu bảo hành, trung tâm sẽ xác nhận thông tin và hướng dẫn khách hàng về quy trình bảo hành tiếp theo, bao gồm cả cách gửi sản phẩm về trung tâm nếu cần.', 4, 1);
INSERT INTO `dieukhoan` VALUES (35, 'Trung tâm bảo hành cam kết xử lý yêu cầu của khách hàng trong thời gian ngắn nhất có thể. Thời gian xử lý cụ thể có thể phụ thuộc vào tình trạng cụ thể của sản phẩm và yêu cầu bảo hành.', 4, 1);
INSERT INTO `dieukhoan` VALUES (36, 'Trung tâm bảo hành có thể áp dụng các chi phí liên quan đến việc sửa chữa, thay thế linh kiện, và vận chuyển sản phẩm. Những chi phí này sẽ được thông báo và thảo luận trước với khách hàng.', 4, 1);
INSERT INTO `dieukhoan` VALUES (37, 'Đối với các sản phẩm có yêu cầu bảo hành điện tử, trung tâm bảo hành sẽ hướng dẫn khách hàng về cách kích hoạt bảo hành và cung cấp hỗ trợ kỹ thuật điện tử.', 4, 1);
INSERT INTO `dieukhoan` VALUES (38, 'Khách hàng có thể liên hệ với trung tâm bảo hành của Galio qua hotline hoặc email để biết thêm chi tiết và hỗ trợ.', 4, 1);
INSERT INTO `dieukhoan` VALUES (39, 'Galio có quyền thay đổi các điều khoản trung tâm bảo hành mà không cần thông báo trước. Việc sử dụng dịch vụ bảo hành sau khi có sự thay đổi đồng nghĩa với việc bạn chấp nhận các điều khoản mới.', 4, 1);
INSERT INTO `dieukhoan` VALUES (40, 'Galio cam kết bảo vệ thông tin cá nhân của khách hàng. Mọi thông tin liên quan đến đặt hàng, thanh toán, và thông tin cá nhân sẽ được bảo quản một cách an toàn và không được chia sẻ với bên thứ ba mà không có sự đồng ý.', 5, 1);
INSERT INTO `dieukhoan` VALUES (41, 'Galio có thể thu thập thông tin cá nhân từ khách hàng như tên, địa chỉ, số điện thoại, và địa chỉ email để phục vụ mục đích đặt hàng và hỗ trợ khách hàng. Thông tin này được thu thập một cách minh bạch và công bằng.', 5, 1);
INSERT INTO `dieukhoan` VALUES (42, 'Thông tin cá nhân của khách hàng sẽ được sử dụng để xác nhận đặt hàng, giao hàng, và hỗ trợ khách hàng. Galio không sử dụng thông tin này cho mục đích quảng cáo hoặc chia sẻ với bên thứ ba mà không có sự đồng ý của khách hàng.', 5, 1);
INSERT INTO `dieukhoan` VALUES (43, 'Galio sử dụng các phương tiện bảo mật tiên tiến để đảm bảo an toàn cho thông tin thanh toán của khách hàng. Mọi giao dịch thanh toán đều được thực hiện qua các kênh bảo mật, giúp ngăn chặn mọi rủi ro có thể phát sinh.', 5, 1);
INSERT INTO `dieukhoan` VALUES (44, 'Galio có thể sử dụng cookie và công cụ theo dõi để cung cấp trải nghiệm mua sắm cá nhân hóa và theo dõi hoạt động trực tuyến của khách hàng trên trang web. Thông tin này giúp cải thiện dịch vụ và tối ưu hóa trang web.', 5, 1);
INSERT INTO `dieukhoan` VALUES (45, 'Galio sử dụng biện pháp bảo mật vững chắc để bảo vệ dữ liệu của khách hàng. Mọi thông tin đều được lưu trữ và xử lý an toàn, ngăn chặn mọi truy cập trái phép.', 5, 1);
INSERT INTO `dieukhoan` VALUES (46, 'Khách hàng có thể nhận thông báo và tin tức từ Galio qua email. Tuy nhiên, khách hàng có quyền hủy đăng ký bất kỳ lúc nào nếu không muốn tiếp tục nhận thông báo.', 5, 1);
INSERT INTO `dieukhoan` VALUES (47, 'Galio có thể thay đổi chính sách bảo mật mà không cần thông báo trước. Người dùng được khuyến khích đọc lại chính sách này đều đặn để cập nhật thông tin mới.', 5, 1);
INSERT INTO `dieukhoan` VALUES (48, 'Nếu có bất kỳ câu hỏi hoặc nhu cầu hỗ trợ về chính sách bảo mật, khách hàng có thể liên hệ với Galio qua các kênh liên lạc được cung cấp trên trang web.', 5, 1);
INSERT INTO `dieukhoan` VALUES (49, 'Sử dụng dịch vụ của Galio đồng nghĩa với việc khách hàng hiểu và chấp nhận các điều khoản trong chính sách bảo mật này.', 5, 1);

-- ----------------------------
-- Table structure for donhang
-- ----------------------------
DROP TABLE IF EXISTS `donhang`;
CREATE TABLE `donhang`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DiaChi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SDT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NgayDat` datetime(0) NULL DEFAULT NULL,
  `KieuGiaoHang` int NULL DEFAULT NULL,
  `GhiChu` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TrangThai` int NULL DEFAULT NULL,
  `IDPhuongThuc` int NULL DEFAULT NULL,
  `IDNguoiDung` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `DonHang_NguoiDung_IDNguoiDung`(`IDNguoiDung`) USING BTREE,
  INDEX `DonHang_PhuongThucThanhToan_IDPhuongThuc`(`IDPhuongThuc`) USING BTREE,
  CONSTRAINT `DonHang_NguoiDung_IDNguoiDung` FOREIGN KEY (`IDNguoiDung`) REFERENCES `nguoidung` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DonHang_PhuongThucThanhToan_IDPhuongThuc` FOREIGN KEY (`IDPhuongThuc`) REFERENCES `phuongthucthanhtoan` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of donhang
-- ----------------------------
INSERT INTO `donhang` VALUES (1, 'Phạm Đức Hoàng', 'Hải Dương', '0906090112', '2023-02-25 15:41:20', 1, 'Gửi hàng nhanh nhá', 1, 1, 1);
INSERT INTO `donhang` VALUES (2, 'Lê Ngọc Mai', 'Hưng Yên', '0987654321', '2023-01-25 15:41:20', 1, 'Cẩn thận hàng dễ vỡ', 1, 1, 2);
INSERT INTO `donhang` VALUES (3, 'Phạm Hải Huấn', 'Hưng Yên', '098234567', '2022-12-25 15:41:20', 2, 'Gửi hàng nhanh nhá', 1, 1, 3);
INSERT INTO `donhang` VALUES (4, 'Trần Mỹ Linh', 'Hà Nội', '093567567', '2022-11-25 15:41:20', 2, 'Cẩn thận hàng dễ vỡ', 1, 2, 4);
INSERT INTO `donhang` VALUES (5, 'Phạm Đức Duy', 'Bắc Giang', '098765567', '2022-10-25 15:41:20', 1, 'Gửi hàng nhanh nhá', 1, 2, 5);
INSERT INTO `donhang` VALUES (9, 'Phạm Văn Hoàn', '123 Điện Biên Phủ tp Hải Dương', '0987654321', '2022-09-03 09:51:12', 3, 'Cẩn thận hàng dễ vỡ', 1, 2, 6);
INSERT INTO `donhang` VALUES (10, 'Lê Ngọc Mai', 'Hưng Yên', '0987654321', '2023-01-03 09:52:40', 1, 'Gửi hàng nhanh nhá', 1, 2, 1);
INSERT INTO `donhang` VALUES (11, 'Phạm Hải Huấn', 'Hưng Yên', '098234567', '2023-02-05 14:46:10', 2, 'Cẩn thận hàng dễ vỡ', 1, 2, 1);
INSERT INTO `donhang` VALUES (12, 'Trần Mỹ Linh', 'Hà Nội', '093567567', '2023-03-07 17:59:41', 1, 'Cẩn thận hàng dễ vỡ', 1, 2, 1);
INSERT INTO `donhang` VALUES (13, 'Phạm Đức Hoàng', 'Hải Dương', '0906090112', '2023-09-20 10:13:56', 3, 'Hàng dễ vỡ', 1, 1, 1);
INSERT INTO `donhang` VALUES (14, 'Phạm Đức Hoàng', 'Hải Dương', '0906090112', '2023-05-20 10:17:07', 1, 'Gửi hàng nhanh nhá', 1, 1, 1);
INSERT INTO `donhang` VALUES (15, 'Phạm Đức Hoàng', 'Hải Dương', '0906090112', '2023-06-20 10:19:14', 1, 'Cẩn thận hàng dễ vỡ', 1, 1, 1);
INSERT INTO `donhang` VALUES (18, 'Phạm Đức Hoàng', 'Hải Dương', '0906090112', '2023-11-20 20:52:47', 1, 'Gửi hàng nhanh nhá', 1, 1, 1);
INSERT INTO `donhang` VALUES (19, 'Phạm Đức Hoàng', 'Hải Dương', '0906090112', '2023-10-20 20:54:38', 1, 'Cẩn thận hàng dễ vỡ', 1, 1, 1);
INSERT INTO `donhang` VALUES (20, 'Phạm Đức Hoàng', 'Hải Dương', '0906090112', '2023-12-20 20:56:43', 1, 'Gửi hàng nhanh nhá', 2, 1, 1);
INSERT INTO `donhang` VALUES (21, 'Phạm Đức Hoàng', 'Hải Dương', '0906090112', '2023-12-20 21:14:10', 1, 'Cẩn thận hàng dễ vỡ', 1, 1, 1);
INSERT INTO `donhang` VALUES (22, 'Phạm Đức Hoàng', 'Hải Dương', '0906090112', '2023-12-21 08:45:10', 1, 'Gửi hàng nhanh nhá', 1, 1, 1);
INSERT INTO `donhang` VALUES (23, 'Phạm Đức Hoàng', 'Hải Dương', '0906090112', '2023-12-21 09:41:54', 1, 'Cẩn thận hàng dễ vỡ', 0, 1, 1);
INSERT INTO `donhang` VALUES (49, 'Lê Ngọc Mai', 'Hưng Yên', '0987654321', '2023-12-22 21:08:11', 1, 'Gửi hàng nhanh nhá', 2, 1, 2);
INSERT INTO `donhang` VALUES (50, 'Lê Ngọc Mai', 'Hưng Yên', '0987654321', '2023-12-22 21:13:08', 1, 'Cẩn thận hàng dễ vỡ', 1, 1, 2);
INSERT INTO `donhang` VALUES (59, 'Phạm Thanh Dương', 'hải dương', '0987654321', '2024-03-21 13:38:56', 1, '', 0, 1, 9);
INSERT INTO `donhang` VALUES (60, 'Phạm Thanh Dương', 'hải dương', '0987654321', '2024-03-21 20:32:41', 1, '', 0, 2, 9);

-- ----------------------------
-- Table structure for giamgia
-- ----------------------------
DROP TABLE IF EXISTS `giamgia`;
CREATE TABLE `giamgia`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PhanTram` int NULL DEFAULT NULL,
  `NgayBatDau` datetime(0) NULL DEFAULT NULL,
  `NgayKetThuc` datetime(0) NULL DEFAULT NULL,
  `IDSanPham` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  CONSTRAINT `GiamGia_SanPham_IDSanPham` FOREIGN KEY (`ID`) REFERENCES `sanpham` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of giamgia
-- ----------------------------
INSERT INTO `giamgia` VALUES (1, 20, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 3);
INSERT INTO `giamgia` VALUES (2, 50, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 4);
INSERT INTO `giamgia` VALUES (3, 40, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 5);
INSERT INTO `giamgia` VALUES (4, 35, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 6);
INSERT INTO `giamgia` VALUES (5, 25, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 1);
INSERT INTO `giamgia` VALUES (6, 30, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 11);
INSERT INTO `giamgia` VALUES (7, 71, '2023-03-09 00:00:00', '2025-01-01 00:00:00', 9);
INSERT INTO `giamgia` VALUES (8, 35, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 15);
INSERT INTO `giamgia` VALUES (9, 10, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 22);
INSERT INTO `giamgia` VALUES (10, 30, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 39);
INSERT INTO `giamgia` VALUES (11, 65, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 49);

-- ----------------------------
-- Table structure for giasanpham
-- ----------------------------
DROP TABLE IF EXISTS `giasanpham`;
CREATE TABLE `giasanpham`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Gia` int NULL DEFAULT NULL,
  `NgayBatDau` datetime(0) NULL DEFAULT NULL,
  `NgayKetThuc` datetime(0) NULL DEFAULT NULL,
  `IDSanPham` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `GiaSanPham_SanPham_IDSanPham`(`IDSanPham`) USING BTREE,
  CONSTRAINT `GiaSanPham_SanPham_IDSanPham` FOREIGN KEY (`IDSanPham`) REFERENCES `sanpham` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of giasanpham
-- ----------------------------
INSERT INTO `giasanpham` VALUES (1, 15250000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 1);
INSERT INTO `giasanpham` VALUES (2, 14250000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 2);
INSERT INTO `giasanpham` VALUES (3, 13450000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 3);
INSERT INTO `giasanpham` VALUES (4, 17545000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 4);
INSERT INTO `giasanpham` VALUES (5, 13500000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 5);
INSERT INTO `giasanpham` VALUES (6, 15000000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 6);
INSERT INTO `giasanpham` VALUES (7, 14000000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 7);
INSERT INTO `giasanpham` VALUES (8, 8190000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 8);
INSERT INTO `giasanpham` VALUES (9, 1289000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 9);
INSERT INTO `giasanpham` VALUES (10, 7500000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 10);
INSERT INTO `giasanpham` VALUES (11, 7500000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 11);
INSERT INTO `giasanpham` VALUES (12, 11000000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 12);
INSERT INTO `giasanpham` VALUES (13, 24990000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 13);
INSERT INTO `giasanpham` VALUES (14, 15290000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 14);
INSERT INTO `giasanpham` VALUES (15, 36400000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 15);
INSERT INTO `giasanpham` VALUES (16, 65990000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 16);
INSERT INTO `giasanpham` VALUES (17, 23190000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 17);
INSERT INTO `giasanpham` VALUES (18, 27090000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 18);
INSERT INTO `giasanpham` VALUES (19, 26690000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 19);
INSERT INTO `giasanpham` VALUES (20, 12990000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 20);
INSERT INTO `giasanpham` VALUES (21, 24490000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 21);
INSERT INTO `giasanpham` VALUES (22, 8760000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 22);
INSERT INTO `giasanpham` VALUES (24, 28490000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 24);
INSERT INTO `giasanpham` VALUES (25, 18890000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 25);
INSERT INTO `giasanpham` VALUES (26, 11490000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 26);
INSERT INTO `giasanpham` VALUES (27, 7390000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 27);
INSERT INTO `giasanpham` VALUES (28, 24990000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 28);
INSERT INTO `giasanpham` VALUES (29, 11790000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 29);
INSERT INTO `giasanpham` VALUES (30, 5850000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 30);
INSERT INTO `giasanpham` VALUES (31, 15490000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 31);
INSERT INTO `giasanpham` VALUES (32, 16455000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 32);
INSERT INTO `giasanpham` VALUES (33, 10390000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 33);
INSERT INTO `giasanpham` VALUES (34, 7210000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 34);
INSERT INTO `giasanpham` VALUES (35, 27490000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 35);
INSERT INTO `giasanpham` VALUES (36, 6200000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 36);
INSERT INTO `giasanpham` VALUES (37, 7390000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 37);
INSERT INTO `giasanpham` VALUES (38, 14090000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 38);
INSERT INTO `giasanpham` VALUES (39, 12990000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 39);
INSERT INTO `giasanpham` VALUES (40, 8590000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 40);
INSERT INTO `giasanpham` VALUES (41, 16890000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 41);
INSERT INTO `giasanpham` VALUES (42, 14300000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 42);
INSERT INTO `giasanpham` VALUES (43, 16390000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 43);
INSERT INTO `giasanpham` VALUES (44, 12990000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 44);
INSERT INTO `giasanpham` VALUES (45, 20390000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 45);
INSERT INTO `giasanpham` VALUES (46, 17390000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 46);
INSERT INTO `giasanpham` VALUES (47, 43590000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 47);
INSERT INTO `giasanpham` VALUES (48, 10390000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 48);
INSERT INTO `giasanpham` VALUES (49, 15490000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 49);
INSERT INTO `giasanpham` VALUES (50, 22690000, '2023-01-01 00:00:00', '2025-01-01 00:00:00', 50);
INSERT INTO `giasanpham` VALUES (51, 32340000, '2022-12-30 06:00:00', '2024-12-30 06:00:00', 51);

-- ----------------------------
-- Table structure for gioithieu
-- ----------------------------
DROP TABLE IF EXISTS `gioithieu`;
CREATE TABLE `gioithieu`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Anh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NoiDung` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TrangThai` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gioithieu
-- ----------------------------
INSERT INTO `gioithieu` VALUES (0, NULL, NULL, NULL);
INSERT INTO `gioithieu` VALUES (1, 'gioithieu1.png', 'Điện máy Mona là một trong những chuỗi bán lẻ điện máy điện tử, điện lạnh và gia dụng. Điện máy Mona thuộc sở hữu của Công tu Cổ phần Đầu tư Phạm Đức Hoàng. So với hệ thống chuỗi cửa hàng thế giới di động thì điện máy Galio sinh sau đẻ muộn hơn. Điện máy Galio ra đời cuối năm 2021, tiền thân là dienmay.com.', 1);
INSERT INTO `gioithieu` VALUES (2, '', 'Ngay sau khi ra đời với chiến lược độc dáo và tầm nhìn xa trông rộng của đội ngũ lãnh đạo. Hệ thống nhanh chóng mở rộng hệ thống siêu thị của mình trên khắp mọi miền đất nước. Dấu mốc đáng nhớ có thể nhắc đến năm 2015 khi Điện máy Galio được đánh gia là \"Phát triển thần tốc\" với 66 siêu thị được khai trương mới. Nâng số lượng siêu thị 20 ở đầu năm 2015 lên con số 86.', 1);
INSERT INTO `gioithieu` VALUES (3, '', 'Điện máy Galio vừa đánh dấu một chặng đường đáng chú ý khi công bố chính thức vượt mốc 1.000 siêu thị . Trong hành trình 10 năm của mình vào năm 2019. Không dừng lại ở đó. Bằng sự nỗ lực và mục tiêu rõ ràng, điện máy Mona tiếp tục triển khai việc. Thay đổi trưng bày cho gần 300 cửa hàng Điện máy Mona mini còn lại trong 6 tháng cuối năm. Nhờ có những chiến lược mạnh mẽ mà Điện máy Mona. Đã trở thành hệ thống bán lẻ điện máy đầu tiên của Việt Nam. Phủ sóng 63/63 tỉnh thành, và luôn  tiên phong dẫn đầu trong việc phục vụ khách hàng tốt nhất.', 1);
INSERT INTO `gioithieu` VALUES (4, '', 'Bên cạnh đó, mô hình Điện máy Galio mini với diện tích từ 350 – 500 m2. Với cách bố trí linh hoạt giúp không gian siêu thị tăng gấp 2 -3 lần. Từ đó trưng bày được nhiều mặt hàng hơn để khách hàng thoải mái lựa chọn. Chính vì những đặc điểm này mà hệ thống siêu thị điện máy xanh. Được đánh giá là hệ thống siêu thị có dịch vụ tốt nhất trong các siêu thị điện máy hiện nay.', 1);

-- ----------------------------
-- Table structure for hoadonnhap
-- ----------------------------
DROP TABLE IF EXISTS `hoadonnhap`;
CREATE TABLE `hoadonnhap`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NgayNhap` datetime(0) NULL DEFAULT NULL,
  `IDNhaCungCap` int NULL DEFAULT NULL,
  `IDNguoiDung` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `HoaDonNhap_NhaCungCap_IDNhaCungCap`(`IDNhaCungCap`) USING BTREE,
  INDEX `HoaDonNhap_NguoiDung_IDNguoiDung`(`IDNguoiDung`) USING BTREE,
  CONSTRAINT `HoaDonNhap_NguoiDung_IDNguoiDung` FOREIGN KEY (`IDNguoiDung`) REFERENCES `nguoidung` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `HoaDonNhap_NhaCungCap_IDNhaCungCap` FOREIGN KEY (`IDNhaCungCap`) REFERENCES `nhacungcap` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hoadonnhap
-- ----------------------------
INSERT INTO `hoadonnhap` VALUES (1, '2023-03-29 17:40:34', 1, 3);
INSERT INTO `hoadonnhap` VALUES (2, '2023-03-29 17:40:34', 2, 1);
INSERT INTO `hoadonnhap` VALUES (3, '2023-03-29 17:40:34', 3, 1);
INSERT INTO `hoadonnhap` VALUES (4, '2023-03-29 17:40:34', 4, 1);
INSERT INTO `hoadonnhap` VALUES (5, '2023-03-29 17:40:34', 5, 3);
INSERT INTO `hoadonnhap` VALUES (6, '2023-03-29 17:40:34', 6, 1);
INSERT INTO `hoadonnhap` VALUES (7, '2023-03-29 17:40:34', 7, 3);
INSERT INTO `hoadonnhap` VALUES (18, '2023-12-30 14:04:46', 2, 1);

-- ----------------------------
-- Table structure for kho
-- ----------------------------
DROP TABLE IF EXISTS `kho`;
CREATE TABLE `kho`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DiaChi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TrangThai` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kho
-- ----------------------------
INSERT INTO `kho` VALUES (1, 'Kho Hải Dương', '56 Nguyễn Lương Bằng', 1);
INSERT INTO `kho` VALUES (2, 'Kho Hà Nội', '12 Thống Nhất, Hai Bà Trưng, tp Hà Nội', 1);
INSERT INTO `kho` VALUES (3, 'Kho Hải Phòng', '67 Võ Nguyên Giám, Đồ Sơn, tp Hải Phòng', 1);
INSERT INTO `kho` VALUES (4, 'Kho Bắc Ninh', '55 Lý Nhân Tông, tp Bắc Ninh, Bắc Ninh', 1);
INSERT INTO `kho` VALUES (5, 'Kho Hưng Yên', '69 Nguyễn Văn Cường, tp Hưng Yên, Hưng Yên', 1);

-- ----------------------------
-- Table structure for lienhe
-- ----------------------------
DROP TABLE IF EXISTS `lienhe`;
CREATE TABLE `lienhe`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NoiDung` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TrangThai` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lienhe
-- ----------------------------
INSERT INTO `lienhe` VALUES (1, 'Đến với chuyên trang thương mại điện tử Galio, mình sẽ hướng dẫn các bạn cách liên lạc với tổng đài Galio. Thông qua số hotline Galio, nhắn tin trực tiếp hoặc gửi mail cho tổng đài. Khi bạn mua hàng trên Galio và gặp rắc rối về đơn hàng, về sản phẩm,… Hoặc bạn muốn khiếu nại, hỗ trợ. Tổng đài Galio ( Galio Hotline ) là kênh thông tin liên lạc kết nối bạn với trung tâm hỗ trợ. Thay vì gọi trực tiếp, bạn có thể chat trực tiếp hoặc nhắn tin qua FB Messenger với nhân viên hỗ trợ.', 1);
INSERT INTO `lienhe` VALUES (2, 'Hotline tổng đài Galio khi bạn gặp các vướng mắc, hay khiếu nại. Hãy gọi đến số hotline tổng đài Galio 19001007. Cước phi cho mỗi cuộc gọi là 1000đ/phút. Tổng đài Galio làm việc từ 9h đến 18h vào các ngày trong tuần kể cả Thứ Bảy, Chủ Nhật trừ ngày lễ.kl', 1);
INSERT INTO `lienhe` VALUES (3, 'Thay vì đặt trên website, bạn cũng có thể gọi điện để đặt hàng trực tiếp. Số tổng đài Galio để đặt hàng là hotline 19001007 . Cước phí cũng là 1000đ/phút. Thời gian làm việc từ 9h đến 18h vào tất cả các ngày trong tuần trừ ngày lễ. Nếu có thắc mắc thêm thì trong quá trình đặt hàng qua điện thoại bạn có thể hỏi tổng đài.', 1);
INSERT INTO `lienhe` VALUES (4, 'Chat trực tuyến với nhân viên hỗ trợ Galio bằng Messenger bạn có thể chat trực tuyến với nhân viên hỗ trợ chăm sóc khách hàng thay vì gọi hotline Galio. Để chat với nhân viên chăm sóc khách hàng của Galio, hãy vào trang Galio.com. Thông thường sẽ chỉ mất vài phút để nhân viên trực tuyến của Galio trả lời cho bạn. So với gọi điện thì chat trực tuyến có ưu điểm hơn. Bạn sẽ không mất cước phí khi trò chuyện. Thời gian làm việc của chat trực tuyến Galio thì muộn hơn so với tổng đài hotline Galio.', 1);
INSERT INTO `lienhe` VALUES (5, 'Tôi được lợi gì khi dùng tài khoản Galio bạn có thể không cần tài khoản để mua hàng trên Galio. Nhưng bạn nên tạo tài khoản riêng cho mình để kiểm soát đơn hàng. Quá trình tạo tài khoản khá đơn giản, nhanh chóng và miễn phí. Việc có tài khoản sẽ thuận tiện hơn vì bạn sẽ theo dõi được tình trạng đơn hàng tốt hơn. Đồng thời bạn có thể hủy đơn hàng trong khi theo dõi, báo đổi trả đơn giản hơn. Biết được sản phẩm mình đặt hiện ở đâu mà không tốn nhiều bước. Ngoài ra bạn còn có được ưu đãi sử dụng mã giảm giá khi dùng tài khoản Galio. Bạn có thể truy cập bộ sưu tập mã giảm giá thông qua bài viết sau.', 1);
INSERT INTO `lienhe` VALUES (6, 'Báo cáo về sản phẩm được bán trên Galio tất cả các vấn đề về sản phẩm bạn hãy liên hệ đến tổng đài ngay để nhận sự hỗ trợ. Galio sẽ rất cảm kích nếu như bạn báo cho Galio về các sản phẩm là hàng giả, hàng nhái,…', 1);
INSERT INTO `lienhe` VALUES (7, 'Làm sao để đổi trả hàng trên Galio nếu như đơn hàng bạn nhận sai về mẫu mã,màu sắc, kích cỡ hay bị vỡ,.. Hãy gọi ngay tổng đài Galio để được hỗ trợ đổi trả hàng. Bạn cần thực hiện quá trình này nhanh nhất có thể trong 24h kể từ khi nhận đơn.', 1);
INSERT INTO `lienhe` VALUES (8, 'Nếu trong quá trình sử dụng, sản phẩm của bạn bị lỗi kĩ thuật. Hãy liên hệ với tổng đài Galio để được hướng dẫn chi tiết nhất các bước bảo hành sản phẩm. Hoặc bạn có thể gọi tổng đài nhờ nhân viên hỗ trợ cách kích hoạt bảo hành điện tử khi mua những mặt hàng như tivi,máy lạnh,laptop,…', 1);

-- ----------------------------
-- Table structure for loaisanpham
-- ----------------------------
DROP TABLE IF EXISTS `loaisanpham`;
CREATE TABLE `loaisanpham`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BieuTuong` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TrangThai` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of loaisanpham
-- ----------------------------
INSERT INTO `loaisanpham` VALUES (1, 'Ti vi', 'icon01.png', 1);
INSERT INTO `loaisanpham` VALUES (2, 'Tủ lạnh', 'icon02.png', 1);
INSERT INTO `loaisanpham` VALUES (3, 'Máy giặt', 'icon03.png', 1);
INSERT INTO `loaisanpham` VALUES (4, 'Điều hoà', 'icon04.png', 1);
INSERT INTO `loaisanpham` VALUES (5, 'Điện thoại', 'icon05.png', 1);
INSERT INTO `loaisanpham` VALUES (6, 'Máy tính bảng', 'icon06.png', 1);
INSERT INTO `loaisanpham` VALUES (7, 'Laptop', 'icon07.png', 1);
INSERT INTO `loaisanpham` VALUES (8, 'Thiết bị văn phòng', 'icon08.png', 1);
INSERT INTO `loaisanpham` VALUES (9, 'Phụ kiện', 'icon09.png', 1);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TrangThai` int NULL DEFAULT NULL,
  `IDCha` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 'Trang chủ', '/', 1, 0);
INSERT INTO `menu` VALUES (2, 'Giới thiệu', '/gioithieu', 1, 0);
INSERT INTO `menu` VALUES (3, 'Tin tức', '/tintuc', 1, 0);
INSERT INTO `menu` VALUES (4, 'Liên hệ', '/lienhe', 1, 0);
INSERT INTO `menu` VALUES (5, 'Tìm kiếm nâng cao', '/timkiem', 1, 0);
INSERT INTO `menu` VALUES (6, 'Điều khoản', NULL, 1, 0);
INSERT INTO `menu` VALUES (7, 'Điều khoản dịch vụ', '/dieukhoandichvu', 1, 6);
INSERT INTO `menu` VALUES (8, 'Quy định đổi trả', '/quydinhdoitra', 1, 6);
INSERT INTO `menu` VALUES (9, 'Quy định bảo hành', '/quydinhbaohanh', 1, 6);
INSERT INTO `menu` VALUES (10, 'Trung tâm bảo hành', '/trungtambaohanh', 1, 6);
INSERT INTO `menu` VALUES (11, 'Chính sách bảo mật', '/chinhsachbaomat', 1, 6);

-- ----------------------------
-- Table structure for nguoidung
-- ----------------------------
DROP TABLE IF EXISTS `nguoidung`;
CREATE TABLE `nguoidung`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TaiKhoan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MatKhau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NgayTao` datetime(0) NULL DEFAULT NULL,
  `DiaChi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SDT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GioiTinh` int NULL DEFAULT NULL,
  `Anh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TrangThai` int NULL DEFAULT NULL,
  `IDQuyen` int NULL DEFAULT NULL,
  `EmailConfimed` bit(1) NULL DEFAULT NULL,
  `Token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `NguoiDung_Quyen_IDQuyen`(`IDQuyen`) USING BTREE,
  CONSTRAINT `NguoiDung_Quyen_IDQuyen` FOREIGN KEY (`IDQuyen`) REFERENCES `quyen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nguoidung
-- ----------------------------
INSERT INTO `nguoidung` VALUES (1, 'phamduchoang', 'e10adc3949ba59abbe56e057f20f883e', 'hoanghd18112002@gmail.com', 'Phạm Đức Hoàng', '2002-11-08 00:00:00', 'Hải Dương', '0906090112', 1, 'avatar.png', 1, 1, b'1', '1f326bbd-b676-4645-af02-1263138513f8');
INSERT INTO `nguoidung` VALUES (2, 'lengocmai', 'e10adc3949ba59abbe56e057f20f883e', 'lengocmai@gmail.com', 'Lê Ngọc Mai', '2001-10-08 00:00:00', 'Hưng Yên', '0987654321', 0, 'lengocmai.png', 1, 2, b'1', '1f326bbd-b676-4645-af02-1263138513f8');
INSERT INTO `nguoidung` VALUES (3, 'phamhaihuan', 'e10adc3949ba59abbe56e057f20f883e', 'phamhaihuan@gmail.com', 'Phạm Hải Huấn', '2002-12-08 00:00:00', 'Hưng Yên', '098234567', 1, 'phamhaihuan.png', 1, 1, b'1', '1f326bbd-b676-4645-af02-1263138513f8');
INSERT INTO `nguoidung` VALUES (4, 'tranmylinh', 'e10adc3949ba59abbe56e057f20f883e', 'tranMyLinh@gmail.com', 'Trần Mỹ Linh', '2002-09-17 00:00:00', 'Hà Nội', '093567567', 0, 'tranmylinh.png', 1, 4, b'1', '1f326bbd-b676-4645-af02-1263138513f8');
INSERT INTO `nguoidung` VALUES (5, 'phamducduy', 'e10adc3949ba59abbe56e057f20f883e', 'phamducduy@gmail.com', 'Phạm Đức Duy', '2002-12-08 00:00:00', 'Bắc Giang', '098765567', 1, 'phamducduy.png', 1, 2, b'1', '1f326bbd-b676-4645-af02-1263138513f8');
INSERT INTO `nguoidung` VALUES (6, 'phamvanhoan', 'e10adc3949ba59abbe56e057f20f883e', 'phamvanhoan@gmail.com', 'Phạm Văn Hoàn', '2002-10-19 00:00:00', '123 Điện Biên Phủ tp Hải Dương', '0987654321', 1, 'phamvanhoan.png', 1, 3, b'1', '1f326bbd-b676-4645-af02-1263138513f8');
INSERT INTO `nguoidung` VALUES (9, 'phamthanhduong', 'e10adc3949ba59abbe56e057f20f883e', 'concao10duoi@gmail.com', 'Phạm Thanh Dương', '2024-03-20 17:03:43', 'hải dương', '0987654321', 1, 'avatar.png', 1, 2, b'1', 'pN2xq4AbYvvXOhDdYSmpnylBu/0mtSBpCkNQSeNjoAY=');

-- ----------------------------
-- Table structure for nhacungcap
-- ----------------------------
DROP TABLE IF EXISTS `nhacungcap`;
CREATE TABLE `nhacungcap`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DiaChi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SDT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TrangThai` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nhacungcap
-- ----------------------------
INSERT INTO `nhacungcap` VALUES (1, 'THP', 'Hà Nội', '0906790112', 1);
INSERT INTO `nhacungcap` VALUES (2, 'Phạm Hoàng', 'Hải Dương', '0906890112', 1);
INSERT INTO `nhacungcap` VALUES (3, 'Hải Long', 'Tp Hồ Chí Minh', '0906990112', 1);
INSERT INTO `nhacungcap` VALUES (4, 'Phạm Duy', 'Đà Nẵng', '0903090112', 1);
INSERT INTO `nhacungcap` VALUES (5, 'Thành Công', 'Hải Phòng', '0906060112', 1);
INSERT INTO `nhacungcap` VALUES (6, 'Ngọc Mai', 'Cần Thơ', '0906590112', 1);
INSERT INTO `nhacungcap` VALUES (7, 'Văn Cường', 'Thái Bình', '0906091112', 1);
INSERT INTO `nhacungcap` VALUES (8, 'Gia Long', 'Thừa Thiên Huế', '0901090112', 1);
INSERT INTO `nhacungcap` VALUES (9, 'Mỹ Linh', 'Bắc Ninh', '0905790112', 1);
INSERT INTO `nhacungcap` VALUES (10, 'Lê Thảo', 'Hưng Yên', '0946090112', 1);
INSERT INTO `nhacungcap` VALUES (11, 'Lò Tuấn', 'Điện Biên', '0996090112', 1);

-- ----------------------------
-- Table structure for nhasanxuat
-- ----------------------------
DROP TABLE IF EXISTS `nhasanxuat`;
CREATE TABLE `nhasanxuat`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Anh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MoTa` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TrangThai` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nhasanxuat
-- ----------------------------
INSERT INTO `nhasanxuat` VALUES (1, 'SamSung', 'samsung.png', 'Tập đoàn Samsung là một tập đoàn đa quốc gia của Hàn Quốc có tổng hành dinh đặt tại Samsung Town, Seoul. Tập đoàn có nhiều công ty con, hầu hết hoạt động dưới thương hiệu Samsung, là tập đoàn thương mại lớn nhất Hàn Quốc', 1);
INSERT INTO `nhasanxuat` VALUES (2, 'PhiLips', 'philips.png', 'Philips là tên gọi phổ biến nhất của Koninklijke Philips Electronics N.V. (Royal Philips Electronics), là một công ty điện tử đa quốc gia Hà Lan', 1);
INSERT INTO `nhasanxuat` VALUES (3, 'Apple', 'apple.png', 'Apple Inc. là một tập đoàn công nghệ đa quốc gia của Mỹ có trụ sở chính tại Cupertino, California, chuyên thiết kế, phát triển và bán thiết bị điện tử tiêu dùng, phần mềm máy tính và các dịch vụ trực tuyến. Nó được coi là một trong Năm công ty lớn của ngà', 1);
INSERT INTO `nhasanxuat` VALUES (4, 'Panasonic', 'panasonic.png', 'Panasonic hiện diện tại Việt Nam từ những năm 1950, sau đó đặt dấu mốc chính thức có mặt tại Việt Nam  vào năm 1971 với nhà máy sản xuất đầu tiên nhằm mục tiêu đóng góp cho xã hội Việt Nam thông qua các hoạt động từ nghiên cứu và phát triển, sản xuất, phâ', 1);
INSERT INTO `nhasanxuat` VALUES (5, 'LG', 'lg.png', 'LG là thương hiệu hàng đầu trong lĩnh vực điện tử, điện lạnh đến từ Hàn Quốc. Thương hiệu được thành lập bởi Koo In-Hwoi vào năm 1947 và có trụ sở chính tại thành phố Seoul.  Hiện tại, thương hiệu này đã mang tới cho người tiêu dùng hàng loạt sản phẩm khá', 1);
INSERT INTO `nhasanxuat` VALUES (6, 'Sony', 'sony.png', 'Sony là một trong những thương hiệu toàn cầu nổi tiếng nhất về điện tử tiêu dùng nhờ vào những sáng tạo đột phá mang tính cách mạng và chất lượng sản phẩm. Thành công của Sony tại thị trường Việt Nam là bởi thương hiệu Sony luôn thể hiện được bản sắc riên', 1);
INSERT INTO `nhasanxuat` VALUES (7, 'TCL', 'tcl.png', 'Thành lập năm 1981, Tập đoàn công nghệ đa phương tiện TCL là một trong những công ty hàng đầu trong công nghệ TV trên toàn cầu, tham gia vào việc nghiên cứu và phát triển, sản xuất và phân phối các sản phẩm điện tử tiêu dùng. Với tư duy đặt người tiêu dùn', 1);
INSERT INTO `nhasanxuat` VALUES (8, 'Sharp', 'sharp.png', 'Thương hiệu Sharp nổi tiếng thế giới với các sản phẩm và giải pháp rất độc đáo. Mục tiêu của chúng tôi là tạo được sự cân bằng giữa thời gian dành cho công việc và cho cuộc sống riêng nhờ vào các sản phẩm có thể hỗ trợ cuộc sống con người trong công việc,', 1);
INSERT INTO `nhasanxuat` VALUES (9, 'Hitachi', 'hitachi.png', 'Tại Hitachi, chúng tôi nhận thức rõ sứ mệnh đóng góp cho xã hội qua việc phát triển những công nghệ và sản phẩm nguyên bản có công năng vượt trội. Vì vậy, Hitachi luôn mở rộng chiến lược Kinh doanh gắn chặt Đổi mới sáng tạo vì Xã hội trên phạm vi toàn cầu', 1);

-- ----------------------------
-- Table structure for phuongthucthanhtoan
-- ----------------------------
DROP TABLE IF EXISTS `phuongthucthanhtoan`;
CREATE TABLE `phuongthucthanhtoan`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MoTa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TrangThai` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of phuongthucthanhtoan
-- ----------------------------
INSERT INTO `phuongthucthanhtoan` VALUES (1, 'Thanh toán khi giao hàng', 'Thanh toán bằng tiền mặt khi giao hàng.', 1);
INSERT INTO `phuongthucthanhtoan` VALUES (2, 'Chuyển khoản ngân hàng', 'Chuyển khoản ngân hàng nội địa vào tài khoản của website', 1);
INSERT INTO `phuongthucthanhtoan` VALUES (3, 'Thanh toán quốc tế', 'Thanh toán qua PayPal, bạn có thể thanh toán bằng thẻ ghi nợ visa hoặc master card nếu bạn không có tài khoản PayPal.', 0);

-- ----------------------------
-- Table structure for quyen
-- ----------------------------
DROP TABLE IF EXISTS `quyen`;
CREATE TABLE `quyen`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MoTa` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TrangThai` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of quyen
-- ----------------------------
INSERT INTO `quyen` VALUES (1, 'Quản trị hệ thống', 'Là người có quyền cao nhất trong hệ thống', 1);
INSERT INTO `quyen` VALUES (2, 'Khách hàng', 'Là người mua hàng trên hệ thống', 1);
INSERT INTO `quyen` VALUES (3, 'Nhân viên', 'Là người có quyền chỉ sau quản trị hệ thống.', 1);
INSERT INTO `quyen` VALUES (4, 'Cộng tác viên viên bài', 'Là người có thể vào hệ thống và quản lý viết tin tức.', 1);

-- ----------------------------
-- Table structure for sanpham
-- ----------------------------
DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE `sanpham`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MoTa` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Anh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NgayTao` datetime(0) NULL DEFAULT NULL,
  `TrangThai` int NULL DEFAULT NULL,
  `IDNhaSanXuat` int NULL DEFAULT NULL,
  `IDLoai` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `SanPham_LoaiSanPham_IDLoai`(`IDLoai`) USING BTREE,
  INDEX `SanPham_NhaSanXuat_IDNhaSanXuat`(`IDNhaSanXuat`) USING BTREE,
  CONSTRAINT `SanPham_LoaiSanPham_IDLoai` FOREIGN KEY (`IDLoai`) REFERENCES `loaisanpham` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SanPham_NhaSanXuat_IDNhaSanXuat` FOREIGN KEY (`IDNhaSanXuat`) REFERENCES `nhasanxuat` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sanpham
-- ----------------------------
INSERT INTO `sanpham` VALUES (1, 'Smart Tivi Samsung UA50AU9000', 'Smart Tivi SamsungUA50AU9000 có thiết kế gọn gàng, tinh tế, tông màu bạc nổi bật, tạo cảm giác sang trọng, hiện đại hơn cho căn phòng sử dụng. Kích thước màn hình lớn 55 inch giúp Smart Tivi SamsungUA50AU9000 rất thích hợp bố trí vào nhiều không gian nội thất khác nhau như phòng khách, phòng họp,... N ài ra, chân đế chữ V bằng kim loại chắc chắn, giúp giữ vững tivi trên nhiều dạng bề mặt phẳng khác nhau', 'smarttivisamsungUA50AU9000.png', '2023-03-30 03:30:04', 1, 1, 1);
INSERT INTO `sanpham` VALUES (2, 'Smart Tivi Samsung UA50AU8000', 'Smart Tivi SamsungUA50AU9000 có thiết kế gọn gàng, tinh tế, tông màu bạc nổi bật, tạo cảm giác sang trọng, hiện đại hơn cho căn phòng sử dụng. Kích thước màn hình lớn 55 inch giúp Smart Tivi SamsungUA50AU9000 rất thích hợp bố trí vào nhiều không gian nội thất khác nhau như phòng khách, phòng họp,... N ài ra, chân đế chữ V bằng kim loại chắc chắn, giúp giữ vững tivi trên nhiều dạng bề mặt phẳng khác nhau', 'smarttivisamsungUA50AU8000.png', '2023-03-30 03:30:04', 1, 1, 1);
INSERT INTO `sanpham` VALUES (3, 'Smart tivi NEO Samsung65', 'Smart Tivi SamsungUA50AU9000 có thiết kế gọn gàng, tinh tế, tông màu bạc nổi bật, tạo cảm giác sang trọng, hiện đại hơn cho căn phòng sử dụng.  Kích thước màn hình lớn 55 inch giúp Smart Tivi SamsungUA50AU9000 rất thích hợp bố trí vào nhiều không gian nội thất khác nhau như phòng khách, phòng họp,... N ài ra, chân đế chữ V bằng kim loại chắc chắn, giúp giữ vững tivi trên nhiều dạng bề mặt phẳng khác nhau', 'smarttivineosamsungqa65.png', '2023-03-30 03:30:04', 1, 1, 1);
INSERT INTO `sanpham` VALUES (4, 'Smart Tivi NEO Samsung75', 'Smart Tivi Neo Samsung75 có thiết kế gọn gàng, tinh tế, tông màu bạc nổi bật, tạo cảm giác sang trọng, hiện đại hơn cho căn phòng sử dụng.Kích thước màn hình lớn 55 inch giúp Smart Tivi SamsungUA50AU9000 rất thích hợp bố trí vào nhiều không gian nội thất khác nhau như phòng khách, phòng họp,... N ài ra, chân đế chữ V bằng kim loại chắc chắn, giúp giữ vững tivi trên nhiều dạng bề mặt phẳng khác nhau', 'smarttivineosamsungqa75.png', '2023-03-30 03:30:04', 1, 1, 1);
INSERT INTO `sanpham` VALUES (5, 'Smart Tivi Samsung UA50AU7000', 'Smart Tivi SamsungUA50AU7000 có thiết kế gọn gàng, tinh tế, tông màu bạc nổi bật, tạo cảm giác sang trọng, hiện đại hơn cho căn phòng sử dụng.Kích thước màn hình lớn 55 inch giúp Smart Tivi SamsungUA50AU9000 rất thích hợp bố trí vào nhiều không gian nội thất khác nhau như phòng khách, phòng họp,... N ài ra, chân đế chữ V bằng kim loại chắc chắn, giúp giữ vững tivi trên nhiều dạng bề mặt phẳng khác nhau', 'smarttivisamsungUA50AU7000.png', '2023-03-30 03:30:04', 1, 1, 1);
INSERT INTO `sanpham` VALUES (6, 'Android Tivi Philips65', 'Android Tivi Philips65 có thiết kế gọn gàng, tinh tế, tông màu bạc nổi bật, tạo cảm giác sang trọng, hiện đại hơn cho căn phòng sử dụng.  Kích thước màn hình lớn 55 inch giúp Smart Tivi SamsungUA50AU9000 rất thích hợp bố trí vào nhiều không gian nội thất khác nhau như phòng khách, phòng họp,... N ài ra, chân đế chữ V bằng kim loại chắc chắn, giúp giữ vững tivi trên nhiều dạng bề mặt phẳng khác nhau', 'androidtiviphilips65.png', '2023-03-30 03:30:04', 1, 2, 1);
INSERT INTO `sanpham` VALUES (7, 'Smart Tivi LG65UP', 'Chiếc tivi có hiệu LG, có thiết kế rất hiện đại. Thuộc thế hệ màn hình phẳng, chỉ dày khoảng 2cm nên nó mỏng và gọn hơn chiếc tivi lồi cũ của nhà em. Toàn thân chiếc tivi được sơn một màu đen bóng loáng, sạch và không hề bị bám bụi, trông rõ nét như một chiếc gương.', 'smarttivilg65up.png', '2023-03-30 03:30:04', 1, 5, 1);
INSERT INTO `sanpham` VALUES (8, 'Smart Tivi QNED LG65', 'Chiếc tivi có hiệu LG, có thiết kế rất hiện đại. Thuộc thế hệ màn hình phẳng, chỉ dày khoảng 2cm nên nó mỏng và gọn hơn chiếc tivi lồi cũ của nhà em. Toàn thân chiếc tivi được sơn một màu đen bóng loáng, sạch và không hề bị bám bụi, trông rõ nét như một chiếc gương.', 'smarttiviqnedlg65.png', '2023-03-30 03:30:04', 1, 5, 1);
INSERT INTO `sanpham` VALUES (9, 'Google Tivi TCL 43P', 'google Tivi TCL 43P Công nghệ xử lý hình ảnh: Dolby Vision, Dải màu rộng Wide Color Gamut, HDR10, Kiểm soát đèn nền Micro Dimming, Tăng cường chuyển động MEMC 60Hz. Tivi TCL được sản xuất tại Việt Nam nên đã bỏ đi các chi phí vận chuyển không cần thiết. Do vậy, mức giá rất cạnh tranh, chỉ từ 5 triệu. Tùy vào ngân sách, bạn có thể lựa chọn một chiếc tivi phù hợp nhất cho gia đình mình.', 'googletivitcl43p.png', '2023-03-30 03:30:04', 1, 7, 1);
INSERT INTO `sanpham` VALUES (10, 'Android Tivi TCL 65P', 'Tivi TCL là sản phẩm của Trung Quốc ra đời vào năm 1981. Sau hơn 30 năm đây đã trở thành thương hiệu tivi gần gũi với mọi nhà. Dòng tivi này còn lọt top 3 thương hiệu tivi bán chạy hàng đầu theo trang TrendForce.  Đây là loại tivi nổi tiếng toàn cầu và đã có mặt hơn 160 quốc gia. Sản phẩm có đặt trụ sở sản xuất tại Việt Nam ở tỉnh Bình Dương. Vì vậy loại tivi này ngày càng phổ biến ở Việt Nam hơn.', 'androidtivitcl 65p.png', '2023-03-30 03:30:04', 1, 4, 1);
INSERT INTO `sanpham` VALUES (11, 'Tủ lạnh Panasonic Inverter', 'Với tủ lạnh Panasonic Inverter NR-TL381GPKV được trang bị ngăn lấy nước n ài kháng khuẩn & khử mùi, với bình chứa dung tích 3 lít, bạn dễ dàng thưởng thức ly nước mát lạnh từ tủ lạnh mà không cần mở cửa. N ài ra, nước được duy trì độ tinh khiết, sạch khuẩn, nhờ bình chứa nước được đúc bằng nhựa kháng khuẩn không chứa BPA, đồng thời giúp khử mùi với bộ lọc carbon ở bên trong.', 'tulanhpanasonic.png', '2023-03-30 03:30:04', 1, 4, 2);
INSERT INTO `sanpham` VALUES (12, 'Tủ lạnh Sharp Inverter', 'Với tủ lạnh Panasonic Inverter NR-TL381GPKV được trang bị ngăn lấy nước n ài kháng khuẩn & khử mùi, với bình chứa dung tích 3 lít, bạn dễ dàng thưởng thức ly nước mát lạnh từ tủ lạnh mà không cần mở cửa.N ài ra, nước được duy trì độ tinh khiết, sạch khuẩn, nhờ bình chứa nước được đúc bằng nhựa kháng khuẩn không chứa BPA, đồng thời giúp khử mùi với bộ lọc carbon ở bên trong.', 'tulanhsharp.png', '2023-03-30 03:30:04', 1, 8, 2);
INSERT INTO `sanpham` VALUES (13, 'Tủ Lạnh Panasonic NRBW530', 'Công nghệ làm lạnh: Làm lạnh vòng cung Panorama Công nghệ kháng khuẩn, khử mùi: Khử mùi, diệt khuẩn 99.99% Nanoe-X giảm lưu lượng thuốc trừ sâu, Loại bỏ vi khuẩn nhờ công nghệ Ag Clean với tinh thể bạc Ag+ Công nghệ bảo quản thực phẩm: Ngăn cấp đông mềm Prime Fresh, Ngăn cấp đông nhanh gấp 5 lần Prime Freeze, Ngăn rau củ Fresh Safe Tiện ích: Bảng điều khiển bên ngoài, Làm đá tự động, Lấy nước bên ngoài Kiểu tủ: Ngăn đá dưới', 'tulanhpanasonicnrbw530.png', '2023-03-30 03:24:00', 1, 4, 2);
INSERT INTO `sanpham` VALUES (14, 'Tủ lạnh Sharp SJ FX420', 'Dung tích tổng:  Dung tích sử dung: 362 lít Số người sử dụng: Dung tích ngăn đá: 125 lít Dung tích ngăn lạnh: 237 lít Công nghệ inverter: J- Tech Inverter Điện năng tiêu thụ: Chế độ tiết kiệm khác: Công nghệ làm lạnh: Công nghệ kháng khuẩn, khử mùi: Bộ khử mùi chống khuẩn Anti-bacterial deodorizer Công nghệ bảo quản thực phẩm: Thực phẩm luôn tươi sống được bảo vệ an toàn với nhiệt độ ngăn đông điều chỉnh - 22 độ Tiện ích: Kiểu tủ: Ngăn đá dưới Số cửa: 4 cửa Chất liệu cửa tủ lạnh: Thép không gỉ Chất liệu khay ngăn: Kính chịu lực Đèn chiếu sáng: Đèn LED Kích thước - Khối lượng: Cao 180 cm - Rộng 79.5 cm - Sâu 61 cm - Nặng 79 kg Nơi sản xuất: Trung Quốc Năm ra mắt: 2020 Bảo hành: 24 tháng', 'tulanhsharpSJ-FX420.png', '2023-03-30 03:30:04', 1, 8, 2);
INSERT INTO `sanpham` VALUES (15, 'Tủ lạnh LG GRX 257', 'Dung tích tổng: 674 lít Dung tích sử dung: 635 lít Số người sử dụng:Trên 5 người Dung tích ngăn đá: 219 lít Dung tích ngăn lạnh: 416 lít Công nghệ inverter: Tủ lạnh inverter Điện năng tiêu thụ: ~1.93 kW/ngày Công nghệ tiết kiệm điện: Linear Inverter Công nghệ làm lạnh: DoorCooling+ làm lạnh từ cánh cửa tủ, Làm lạnh đa chiều Công nghệ kháng khuẩn, khử mùi: Bộ lọc 5 lớp Hygiene Fresh+™ Công nghệ bảo quản thực phẩm: Ngăn cân bằng ẩm Moist Balance Crisper, Ngăn rau củ cân bằng ẩm lưới mắt cáo 2 chế độ Fresh Balancer Tiện ích: Cửa phụ Door-in-Door, Lấy nước ngoài diệt khuẩn UV nano, Tích hợp WIFI - Smart ThinQ™ Kiểu tủ: Side by side Số cửa: 2 cửa Chất liệu cửa tủ lạnh: Thép không gỉ Chất liệu khay ngăn: Kính chịu lực Đèn chiếu sáng: Đèn LED Kích thước - Khối lượng: Cao 179 cm - Rộng 91.3 cm - Sâu 73.5 cm - Nặng 130 kg Nơi sản xuất: Trung Quốc Năm ra mắt: 2022 Bảo hành: 24 tháng', 'tulanhlggrx257.png', '2023-03-30 03:30:40', 1, 5, 2);
INSERT INTO `sanpham` VALUES (16, 'Tủ lạnh Samsung RF50A', 'Dung tích tổng: 645 lít Dung tích sử dung: 599 lít Số người sử dụng: Trên 5 người Dung tích ngăn đá: 215 lít Dung tích ngăn lạnh: 384 lít Công nghệ inverter: Digital Inverter Công suất tiêu thụ công bố theo TCVN: ~ 1.45 kW/ngày Chế độ tiết kiệm khác: Tùy chỉnh nhiệt độ phù hợp với bảng điều khiển điện tử tiện dụng Công nghệ làm lạnh: 3 Dàn lạnh độc lập Triple Cooling giúp hơi lạnh lan tỏa đều, Công nghệ Metal Cooling Công nghệ kháng khuẩn, khử mùi: Bộ lọc khử mùi từ không khí ở bên trong, kết hợp thêm công nghệ đèn UV liên tục làm sạch bề mặt giúp giữ được không khí trong lành Công nghệ bảo quản thực phẩm: Hộp rau củ, trái cây kín khí Crisper+ và Hộp thịt cá Flex Crisper Tiện ích: Làm đá tự động, Ngăn chuyển đổi linh hoạt, Ngăn đông mềm trữ thịt cá không cần rã đông Kiểu tủ: Multi Door Số cửa: 4 cánh Chất liệu cửa tủ lạnh: Kính Bespoke Chất liệu khay ngăn: Kính chịu lực Đèn chiếu sáng: Đèn LED Kích thước - Khối lượng: Cao 185.3 cm - Rộng 91.2 cm - Sâu 67.3 cm - Nặng 149 kg Nơi sản xuất', 'tulanhsamsungrf50a.png', '2023-03-30 11:17:55', 1, 1, 2);
INSERT INTO `sanpham` VALUES (17, 'Tủ lạnh Sharp SJF XP64', 'Dung tích tổng: 639 lít Dung tích sử dung: 572 lít Số người sử dụng: Trên 5 người Dung tích ngăn đá: 206 lít Dung tích ngăn lạnh: 366 lít Công nghệ inverter: J-tech Inverter Điện năng tiêu thụ: ~ 1.23 kW/ngày Chế độ tiết kiệm khác: Công nghệ làm lạnh: Hệ thống làm lạnh kép Hybrid Cooling Công nghệ kháng khuẩn, khử mùi: Bộ lọc kháng khuẩn, Công nghệ diệt khuẩn Plasmacluster Ion Công nghệ bảo quản thực phẩm: Chế độ làm đông nhanh đưa nhiệt độ ngăn đông xuống -24 ⁰C, Ngăn rau quả giữ ẩm, Ngăn đông mềm -1.5 độ C (Extra cool plus) Tiện ích: Bảng điều khiển bên ngoài, Chuông báo khi quên đóng cửa Kiểu tủ: Tủ lạnh ngăn đá dưới Số cửa: 4 cửa Chất liệu cửa tủ lạnh: Kính cường lực Chất liệu khay ngăn: Kính chịu lực Đèn chiếu sáng: Đèn LED Kích thước - Khối lượng: Cao 183 cm - Rộng 89 cm - Sâu 78 cm - Nặng 110 kg Nơi sản xuất: Thái Lan Năm ra mắt: 2021 Bảo hành: 24 tháng', 'tulanhsharpsjfxp64.png', '2023-03-30 11:18:43', 1, 8, 2);
INSERT INTO `sanpham` VALUES (18, 'Tủ lạnh Hitachi RWB640', 'Dung tích tổng: 638 lít Dung tích sử dung:  569 lít Số người sử dụng: Trên 5 người Dung tích ngăn đá: 100 lít Dung tích ngăn chuyển đổi: 97 lít Dung tích ngăn lạnh: 372 lít Công nghệ inverter: Tủ lạnh Inverter Điện năng tiêu thụ: ~ 1.63 kW/ngày Chế độ tiết kiệm khác: Cảm biến nhiệt ECO, Hệ thống quạt kép, Inverter Công nghệ làm lạnh: Hệ thống làm lạnh quạt kép, Làm lạnh nhanh Công nghệ kháng khuẩn, khử mùi: Bộ lọc khử mùi 3 lớp Triple Power Công nghệ bảo quản thực phẩm: Ngăn chuyển đổi đa năng Selectable Zone (có Đông mềm -3°C), Ngăn rau quả giữ rau củ quả tươi ngon với độ ẩm và nhiệt độ tối ưu Tiện ích:Bình chứa nước với bộ lọc, Bảng điều khiển màn hình LED, Chuông báo khi quên đóng cửa, Chế độ cấp đông nhanh, Làm đá tự động, Đệm cửa chống mốc Kiểu tủ: Multi Door Số cửa: 4 cửa Chất liệu cửa tủ lạnh: Mặt kính Chất liệu khay ngăn: Kính chịu lực Đèn chiếu sáng: Đèn LED Kích thước - Khối lượng: Cao 184 cm - Rộng 90 cm - Sâu 72 cm - Nặng 106 kg Nơi sản xuất: Thái Lan Năm sản xuất: 2021 Bảo', 'tulanhhitachirwb640.png', '2023-03-30 11:19:18', 1, 9, 2);
INSERT INTO `sanpham` VALUES (19, 'Tủ lạnh Hitachi Inverter 540', 'Dung tích tổng: 540 lít Dung tích sử dung:   Số người sử dụng: Trên 7 người Dung tích ngăn đá: 144 lít Dung tích ngăn lạnh: 396 lít Công nghệ inverter: Tủ lạnh Inverter Điện năng tiêu thụ: KW/ngày Chế độ tiết kiệm khác: Cảm biến nhiệt ECO Công nghệ làm lạnh: Hệ thống làm lạnh kép Công nghệ kháng khuẩn, khử mùi: Màng lọc Nano Titanium, Đệm cửa chống nấm mốc Công nghệ bảo quản thực phẩm: Ngăn rau quả thông minh Aero-care Tiện ích: Còn có chuông cửa, bảng điều khiển LED, Inverter tiết kiệm điện, Mặt gương sang trọng, dễ vệ sinh, làm đá tự động Kiểu tủ: Multi Door Số cửa: 4 cửa Chất liệu cửa tủ lạnh: Mặt gương Chất liệu khay ngăn: Kính chịu lực Đèn chiếu sáng: Đèn LED Kích thước - Khối lượng: Cao 183.5 cm - Rộng 85.5 cm - Sâu 72.7 cm - Nặng 99 kg Nơi sản xuất: Thái Lan Năm ra mắt: 2018 Bảo hành: 12 Tháng', 'tulanhhitachiinverter540.png', '2023-03-30 11:19:43', 1, 9, 2);
INSERT INTO `sanpham` VALUES (20, 'Iphone12', 'Cấu hình iPhone 12 · Chip A20 Bionic · RAM: 4GB · Bộ nhớ 64GB/128GB/256GB · Màn hình 6.1 inch Super Retina XDR OLED (2532 x 1170 ở mật độ điểm ảnh 476ppi)', 'iphone12.png', '2023-03-30 11:20:07', 1, 3, 5);
INSERT INTO `sanpham` VALUES (21, 'Iphone14', 'Thiết kế của iPhone 14 cũng trông khá tương đồng với người tiền nhiệm của mình khi có hai mặt trước sau bằng kính và khung viền kim loại vuông vức cùng các góc được bo cong mềm mại, tạo sự hài hòa và mang lại cảm giác cầm nắm dễ chịu. \r\n\r\nMặt sau của iPhone 14 ta sẽ bắt gặp logo \'táo khuyết\' quen thuộc cùng cụm hai camera với ống kính lồi lên khá cao được đặt ở góc trái. ', 'iphone14.png', '2023-03-30 11:20:35', 1, 3, 5);
INSERT INTO `sanpham` VALUES (22, 'Iphone 8 plus', 'Cấu hình iPhone 8 plus · Chip A7 Bionic · RAM: 4GB · Bộ nhớ 64GB/128GB/256GB · Màn hình 6.1 inch Super Retina XDR OLED (2532 x 1170 ở mật độ điểm ảnh 476ppi)', 'iphone8plus.png', '2023-04-03 12:45:38', 1, 3, 5);
INSERT INTO `sanpham` VALUES (24, 'Iphone 11', 'Vi xử lý & đồ họa  Loại CPU  Hexa-core Chipset  A13 Bionic GPU  Apple GPU Màn hình  Kích thước màn hình  6.1 inches Độ phân giải màn hình  1792 x 828 pixel Công nghệ màn hình  IPS LCD Công nghệ màn hình  IPS LCD Tính năng màn hình  True-tone Tần số quét  60Hz Giao tiếp & kết nối  Hệ điều hành  iOS 13 hoặc cao hơn (Tùy vào phiên bản phát hành) Wi-Fi  802.11ax Wi‑Fi 6 with 2x2 MIMO Bluetooth  5.0 Thẻ SIM  Nano-SIM + eSIM Hồng ngoại  Không Jack tai nghe 3.5  Không Công nghệ NFC  Có Hỗ trợ mạng  4G GPS  GPS/GNSS Pin & công nghệ sạc  Pin  3110 mAh Công nghệ sạc  Sạc nhanh 18W Power Delivery 2.0 Cổng sạc  Lightning Thiết kế & Trọng lượng  Kích thước  150.9mm - 75.7mm - 8.3mm Trọng lượng  194 g Chất liệu mặt lưng  Kính Chất liệu khung viền  Kim loại Camera sau  Camera sau  Camera kép 12MP: - Camera góc rộng: ƒ/1.8 aperture - Camera siêu rộng: ƒ/2.4 aperture Quay video  Quay video 4K ở tốc độ 24 fps, 30 fps hoặc 60 fps Tính năng camera  Retina Flash Nhãn dán (AR Stickers) Ban đêm (Night Mode) ', 'ip11.png', '2023-04-03 12:46:39', 1, 3, 5);
INSERT INTO `sanpham` VALUES (25, 'Iphone 13 128GB', 'Màn hình  Kích thước màn hình  6.1 inches Độ phân giải màn hình  2532 x 1170 pixels Công nghệ màn hình  OLED Tính năng màn hình  Màn hình super Retina XDR, OLED, 460 ppi, HDR display, công nghệ True Tone Wide color (P3), Haptic Touch, Lớp phủ oleophobic chống bám vân tay Tần số quét  60Hz Giao tiếp & kết nối  Hệ điều hành  iOS 15 Wi-Fi  Wi‑Fi 6 (802.11ax) Bluetooth  v5.0 Jack tai nghe 3.5  Không Công nghệ NFC  Có Hỗ trợ mạng  5G GPS  GPS, GLONASS, Galileo, QZSS, and BeiDou Pin & công nghệ sạc  Pin  3.240mAh Công nghệ sạc  Sạc nhanh 20W, Sạc không dây, Sạc ngược không dây 15W, Sạc pin nhanh, Tiết kiệm pin Cổng sạc  Lightning Thiết kế & Trọng lượng  Kích thước  146,7 x 71,5 x 7,65mm Trọng lượng  174g Chất liệu mặt lưng  Kính Chất liệu khung viền  Kim loại Camera sau  Camera sau  Camera góc rộng: 12MP, f/1.6 Camera góc siêu rộng: 12MP, ƒ/2.4 Quay video  4K 2160p@30fps FullHD 1080p@30fps FullHD 1080p@60fps HD 720p@30fps Tính năng camera  Chạm lấy nét HDR Nhận diện khuôn mặt Quay chậm (Slow', 'iphong.png', '2023-04-03 12:47:09', 1, 3, 5);
INSERT INTO `sanpham` VALUES (26, 'Điều hòa Panasonic CU/CS-XPU', 'Tổng quan Công suất làm lạnh: 1.5 HP - 12000 BTU Công suất sưởi ấm: Không có sưởi ấm  Phạm vi làm lạnh hiệu quả: Từ 15 - 20 m2 (từ 40 đến 60 m3) Công nghệ Inverter: Điều hòa inverter Loại máy: Điều hoà 1 chiều (chỉ làm lạnh) Công suất tiêu thụ điện tối đa: Tính Năng Tiện ích:Chế độ vận hành khi ngủ, Chức năng hút ẩm, Hẹn giờ bật tắt máy, Hoạt động siêu êm Chế độ tiết kiệm điện:  Kháng khuẩn khử mùi: Kháng khuẩn khử mùi Nanoe-X Chế độ làm lạnh nhanh: Chế độ gió:Tuỳ chỉnh điều khiển lên xuống  Thông tin chung Thông tin cục lạnh: Thông tin cục nóng: Loại Gas sử dụng: R32 Nơi sản xuất:Malaysia Năm ra mắt: 2021 Bảo hành: 12 tháng', 'dh10.png', '2023-04-03 12:47:35', 1, 4, 4);
INSERT INTO `sanpham` VALUES (27, 'Điều hòa Panasonic CU/CS-N9', 'Tổng quan Công suất làm lạnh: 1 HP - 9.000 BTU Công suất sưởi ấm: Không có sưởi ấm  Phạm vi làm lạnh hiệu quả: Dưới 15 m2 (từ 30 đến 45 m3) Công nghệ Inverter: Không Loại máy: Điều hoà 1 chiều (chỉ làm lạnh) Công suất tiêu thụ điện tối đa: Tính Năng Tiện ích:Chế độ vận hành khi ngủ, Chức năng hút ẩm, Hẹn giờ bật tắt máy, Hoạt động siêu êm Chế độ tiết kiệm điện:  Kháng khuẩn khử mùi: Kháng khuẩn khử mùi Nanoe-G Chế độ làm lạnh nhanh: Chế độ gió:Tuỳ chỉnh điều khiển lên xuống  Thông tin chung Thông tin cục lạnh: Thông tin cục nóng: Loại Gas sử dụng: Nơi sản xuất:Malaysia Năm ra mắt: 2020 Bảo hành: 12 tháng', 'dh9.png', '2023-04-03 12:47:58', 1, 4, 4);
INSERT INTO `sanpham` VALUES (28, 'Điều hòa Panasonic CU/CS-XZ1', 'Tổng quan Công suất làm lạnh: 18000 BTU Công suất sưởi ấm: 20500 BTU Phạm vi làm lạnh hiệu quả: Từ 20 - 30m² (từ 60 đến 80m³) Công nghệ Inverter: Điều hòa inverter Loại máy: Điều hoà 2 chiều Tiêu thụ điện: 1.13 kW/h Tính Năng Tiện ích: Chế độ iAuto X làm lạnh nhanh, Chức năng khử ẩm, Chức năng lọc không khí Nanoe-G, ECO tích hợp A.I tiết kiệm điện, Hẹn giờ bật tắt máy, Điều khiển bằng điện thoại, có wifi Chế độ tiết kiệm điện: ECO tích hợp A.I, Inverter Lọc bụi, kháng khuẩn, khử mùi: Nanoe-G lọc bụi mịn PM 2.5, Nanoe-X diệt khuẩn, khử mùi, duy trì độ ẩm Chế độ làm lạnh nhanh: iAuto-X Chế độ gió: Điều khiển lên xuống tự động, trái phải tùy chỉnh tay  Thông tin chung Thông tin cục lạnh: Dài 104 cm - Cao 29.5 cm - Dày 24.4 cm - Nặng 12 kg Thông tin cục nóng: Dài 87.5 cm - Cao 61.5 cm - Dày 32 cm - Nặng 41 kg Loại Gas sử dụng: R-32 Nơi sản xuất: Malaysia Năm ra mắt: 2021 Bảo hành: 12 tháng', 'dh8.png', '2023-04-03 12:48:19', 1, 4, 4);
INSERT INTO `sanpham` VALUES (29, 'Điều hòa Samsung AR18TYHYC', 'Tổng quan Công suất làm lạnh: 2 HP - 18.000 BTU Công suất sưởi ấm: Không có sưởi ấm Phạm vi làm lạnh hiệu quả: Từ 20 - 30m² (từ 60 đến 80m³) Công nghệ Inverter: Điều hòa inverter Loại máy: Điều hoà 1 chiều (chỉ làm lạnh) Tiêu thụ điện: 1.72 kW/h Tính Năng Tiện ích: Chế độ chỉ sử dụng quạt Fan Only - chỉ làm mát, không làm lạnh, Chức năng hút ẩm, Chức năng tự làm sạch, Có tự điều chỉnh nhiệt độ (chế độ ngủ đêm), Hẹn giờ bật tắt máy, Làm lạnh nhanh tức thì, Tự khởi động lại khi có điện Công nghệ tiết kiệm điện:, Digital Inverter, Eco Kháng khuẩn khử mùi: Bộ lọc thô Easy Filter, Màng lọc kháng khuẩn Ag+ Chế độ làm lạnh nhanh: Có Chế độ gió: Tuỳ chỉnh điều khiển lên xuống trái phải tự động  Thông tin chung Thông tin cục lạnh: Dài 89 cm - Cao 30 cm - Dày 21.8 cm - Nặng 10 kg Thông tin cục nóng: Dài 88 cm - Cao 54.5 cm - Dày 30 cm - Nặng 30.2 kg Loại Gas sử dụng: R-32 Nơi sản xuất: Thái Lan Năm ra mắt: 2020 Bảo hành: 24 tháng', 'dh7.png', '2023-04-03 12:48:39', 1, 1, 4);
INSERT INTO `sanpham` VALUES (30, 'Điều hòa Samsung AR09TYHQA', 'Tổng quan Công suất làm lạnh: 1 HP - 9.000 BTU Công suất sưởi ấm: Không có sưởi ấm  Phạm vi làm lạnh hiệu quả: Dưới 15 m2 (từ 30 đến 45 m3) Công nghệ Inverter: Điều hòa inverter Loại máy: Điều hoà 1 chiều (chỉ làm lạnh) Công suất tiêu thụ điện tối đa: Tính Năng Tiện ích:Chế độ vận hành khi ngủ, Chức năng hút ẩm, Hẹn giờ bật tắt máy Chế độ tiết kiệm điện:  Kháng khuẩn khử mùi: Bộ Lọc HD Chế độ làm lạnh nhanh: Chế độ gió:Tuỳ chỉnh điều khiển lên xuống  Thông tin chung Thông tin cục lạnh: Dài 80.5 cm - Cao 28.5 cm - Dày 19.4 cm - Nặng 8.8 kg Thông tin cục nóng: Dài 72 cm - Cao 49.5 cm - Dày 27.04 cm - Nặng 21.3 kg Loại Gas sử dụng: Nơi sản xuất: Trung Quốc Năm ra mắt: 2020 Bảo hành: 24 tháng', 'dh6.png', '2023-04-03 12:49:00', 1, 1, 4);
INSERT INTO `sanpham` VALUES (31, 'Ipad 10.5 ', 'iPad là máy tính bảng do Apple Inc phát triển. Được công bố vào ngày 27 tháng 1 năm 2010, thiết bị này tạo ra một phân loại mới giữa điện thoại thông minh và máy tính xách tay.[8]\r\n\r\nTương tự về tính năng so với thiết bị nhỏ và yếu hơn là iPhone hoặc iPod touch, iPad cũng hoạt động trên cùng hệ điều hành iPhone OS đã được sửa đổi[9][10] với giao diện được thiết kế lại để phù hợp với màn hình lớn.[11] iPad có màn hình chạm đa điểm sử dụng đèn led chiếu sáng 9.7 inch, bộ nhớ từ 16 tới 64', 'ipad10.5.png', '2023-04-03 12:49:21', 1, 3, 6);
INSERT INTO `sanpham` VALUES (32, 'Ipad 11', 'iPad là máy tính bảng do Apple Inc phát triển. Được công bố vào ngày 27 tháng 1 năm 2010, thiết bị này tạo ra một phân loại mới giữa điện thoại thông minh và máy tính xách tay.[8]\r\n\r\nTương tự về tính năng so với thiết bị nhỏ và yếu hơn là iPhone hoặc iPod touch, iPad cũng hoạt động trên cùng hệ điều hành iPhone OS đã được sửa đổi[9][10] với giao diện được thiết kế lại để phù hợp với màn hình lớn.[11] iPad có màn hình chạm đa điểm sử dụng đèn led chiếu sáng 9.7 inch, bộ nhớ từ 16 tới 64', 'ipad11.png', '2023-04-03 12:49:42', 1, 3, 6);
INSERT INTO `sanpham` VALUES (33, 'Điều hòa Samsung AR13TYGCD', 'Tổng quan Công suất làm lạnh: 12000BTU Phạm vi làm lạnh hiệu quả: Từ 15 - 20m² (từ 40 đến 60 m³) Công nghệ Inverter: Điều hòa inverter Loại máy: Điều hoà 1 chiều Tiêu thụ điện:  Tính Năng Tiện ích: Bộ ba Triple Protector Plus bảo vệ tối ưu cho hiệu suất bền bỉ, Chế độ chỉ sử dụng quạt Fan Only - chỉ làm mát, không làm lạnh, Chế độ Wind-Free cho hơi lạnh thoải mái, Chức năng hút ẩm, Chức năng tự làm sạch, Có tự điều chỉnh nhiệt độ (chế độ ngủ đêm), Dàn tản nhiệt phủ lớp chống ăn mòn Durafin, Hẹn giờ bật tắt máy, Làm lạnh nhanh tức thì ,Màn hình hiển thị nhiệt độ trên dàn lạnh, Tự khởi động lại khi có điện, Đảo gió 4 chiều giúp hơi lạnh lan toả đồng đều Chế độ tiết kiệm điện: Digital Inverter Boost, Eco Hệ thống lọc không khí: Bộ lọc thô Easy Filter, Bộ lọc Tri Care Filter lọc bụi, chống nấm mốc, kháng khuẩn Chế độ làm lạnh nhanh: Có Chế độ gió: Tuỳ chỉnh điều khiển lên xuống trái phải tự động  Thông tin chung Thông tin cục lạnh: Dài 82 cm - Cao 30.5 cm - Dày 21.5 cm - Nặng 9.2 kg Thông ', 'dh5.png', '2023-04-03 12:50:10', 1, 1, 4);
INSERT INTO `sanpham` VALUES (34, 'Điều hòa Sharp AH-X9XEW', 'Tổng quan Công suất làm lạnh: 9.000 BTU Công suất sưởi ấm: Không có sưởi ấm  Phạm vi làm lạnh hiệu quả: Dưới 15 m2 (từ 30 đến 45 m3) Công nghệ Inverter: Điều hòa inverter Loại máy: Điều hoà 1 chiều (chỉ làm lạnh) Công suất tiêu thụ trung bình:0.8 kW/h Tính Năng Tiện ích: Thổi gió dễ chịu (cho trẻ em, người già), Hẹn giờ bật tắt máy, Làm lạnh nhanh tức thì, Tự khởi động lại khi có điện Chế độ tiết kiệm điện: J-Tech Inverter, Eco Hệ thống lọc không khí: Lưới bụi polypropylene Chế độ làm lạnh nhanh: Powerful Jet Chế độ gió: Điều khiển trái phải tự động  Thông tin chung Thông tin cục lạnh: Dài 87.7 cm - Cao 29.2 cm - Dày 22.2 cm - Nặng 8 kg Thông tin cục nóng: Dài 66.5 cm - Cao 49.5 cm - Dày 29.5 cm - Nặng 18 kg Loại Gas sử dụng: R-32 Nơi sản xuất: Thái Lan Năm ra mắt: 2020 Bảo hành: 12 tháng', 'dh4.png', '2023-04-03 12:50:33', 1, 8, 4);
INSERT INTO `sanpham` VALUES (35, 'Máy giặt Samsung WD21', 'Công nghệ giặt: Chế độ ngâm Bubble Soak, AI Wash tối ưu lượng nước giặt xả, lượng nước và thời gian giặt, VRT Plus ™ giảm rung ồn đến 30%, Giặt hơi nước Hygiene Steam diệt 99.9% vi khuẩn, QuickDrive giặt xả hiệu quả chỉ trong 39 phút, AI Dispenser tự động cân chỉnh lượng nước giặt, nước xả, Kết nối với điện thoại thông qua ứng dụng SmartThings, Bảng điều khiển AI control tự động ghi nhớ chế độ giặt, Airwash khử mùi & kháng khuẩn, Công nghệ giặt bong bóng Eco Bubble', 'maygiatsamsungWD21.png', '2023-04-03 12:50:55', 1, 1, 3);
INSERT INTO `sanpham` VALUES (36, 'Máy Giặt Panasonic CN-AF1', 'Công nghệ giặt: Chế độ ngâm Bubble Soak, AI Wash tối ưu lượng nước giặt xả, lượng nước và thời gian giặt, VRT Plus ™ giảm rung ồn đến 30%, Giặt hơi nước Hygiene Steam diệt 99.9% vi khuẩn, QuickDrive giặt xả hiệu quả chỉ trong 39 phút, AI Dispenser tự động cân chỉnh lượng nước giặt, nước xả, Kết nối với điện thoại thông qua ứng dụng SmartThings, Bảng điều khiển AI control tự động ghi nhớ chế độ giặt, Airwash khử mùi & kháng khuẩn, Công nghệ giặt bong bóng Eco Bubble', 'maygiatpanasonicnaf1.png', '2023-04-03 12:51:22', 1, 4, 3);
INSERT INTO `sanpham` VALUES (37, 'Máy giặt LG T23', 'Công nghệ giặt: Chế độ ngâm Bubble Soak, AI Wash tối ưu lượng nước giặt xả, lượng nước và thời gian giặt, VRT Plus ™ giảm rung ồn đến 30%, Giặt hơi nước Hygiene Steam diệt 99.9% vi khuẩn, QuickDrive giặt xả hiệu quả chỉ trong 39 phút, AI Dispenser tự động cân chỉnh lượng nước giặt, nước xả, Kết nối với điện thoại thông qua ứng dụng SmartThings, Bảng điều khiển AI control tự động ghi nhớ chế độ giặt, Airwash khử mùi & kháng khuẩn, Công nghệ giặt bong bóng Eco Bubble', 'maygiatlgt23.png', '2023-04-03 12:51:41', 1, 5, 3);
INSERT INTO `sanpham` VALUES (38, 'Máy giặt Panasonic NAV90', 'Loại máy giặt: Cửa trước Lồng giặt: Lồng ngang Khối lượng giặt: 9 kg Khối lượng sấy: 2 kg Tốc độ quay vắt: 1400 vòng/phút Hiệu suất sử dụng điện: 13.7 Wh/kg Kiểu động cơ: Truyền động gián tiếp (dây Curoa) Inverter: Công nghệ 3Di Inverter Công nghệ giặt Chương trình hoạt động: 16 chương trình Công nghệ giặt: Cảm biến Econavi, Giặt diệt khuẩn bằng nước lạnh UV Blue Ag+, Giặt nước nóng StainMaster+, Hệ thống ActiveFoam Tiện ích: Có sấy, Khóa trẻ em, vệ sinh lồng giặt Tổng quan Chất liệu lồng giặt: Thép không gỉ Chất liệu vỏ máy: Kim loại sơn tĩnh điện Chất liệu nắp máy: Kính chịu lực Bảng điều khiển: Song ngữ Anh-Việt Số người sử dụng: Trên 7 người (Trên 10 kg) Kích thước - Khối lượng: Cao 84.5 cm - Ngang 59 cm - Sâu 58.5 cm - Nặng 69 kg Nơi sản xuất: Việt nam Năm ra mắt: 2022 Bảo hành: 24 tháng', 'maygiatpanasonicnav90.png', '2023-04-03 12:52:05', 1, 4, 3);
INSERT INTO `sanpham` VALUES (39, 'Máy giặt Panasonic NA-V10', 'Công nghệ giặt: Chế độ ngâm Bubble Soak, AI Wash tối ưu lượng nước giặt xả, lượng nước và thời gian giặt, VRT Plus ™ giảm rung ồn đến 30%, Giặt hơi nước Hygiene Steam diệt 99.9% vi khuẩn, QuickDrive giặt xả hiệu quả chỉ trong 39 phút, AI Dispenser tự động cân chỉnh lượng nước giặt, nước xả, Kết nối với điện thoại thông qua ứng dụng SmartThings, Bảng điều khiển AI control tự động ghi nhớ chế độ giặt, Airwash khử mùi & kháng khuẩn, Công nghệ giặt bong bóng Eco Bubble', 'maygiatpanasonicna-v10.png', '2023-04-03 12:52:26', 1, 4, 3);
INSERT INTO `sanpham` VALUES (40, 'Máy giặt Sharpe SFK1054', 'Loại máy giặt: Cửa ngang Lồng giặt: Lồng ngang Khối lượng giặt: Giặt 10.5 kg Tốc độ quay vắt: 1400 vòng/phút Hiệu suất sử dụng điện: 7.76 Wh/kg Kiểu động cơ: Truyền động gián tiếp (dây Curoa) Inverter: Có Công nghệ giặt Chương trình hoạt động:  Công nghệ giặt: Công nghệ giặt hơi nước Steam Tiện ích: Giặt nhanh 15 phút, Giặt nước nóng tới 90 độ C, Khóa trẻ em, Thêm đồ trong khi giặt, Tự khởi động lại khi có điện, Vệ sinh lồng giặt, Đèn chiếu sáng lồng giặt Tổng quan Chất liệu lồng giặt: Thép không gỉ Chất liệu vỏ máy: Thép cao cấp Chất liệu nắp máy: Kim loại sơn tĩnh điện Bảng điều khiển: Song ngữ Anh - Việt nút nhấn có màn hình hiển thị Số người sử dụng: Trên 7 người (Trên 10 kg) Kích thước - Khối lượng: Cao 85 cm - Ngang 59.8 cm - Sâu 68 cm - Nặng Nặng 80 kg Nơi sản xuất: Trung Quốc Năm ra mắt: 2021 Bảo hành: 12 tháng', 'maygiatsharpesfk1054.png', '2023-04-03 12:52:46', 1, 8, 3);
INSERT INTO `sanpham` VALUES (41, 'Máy giặt Panasonic NAS96', 'Loại máy giặt: Cửa trước Lồng giặt: Lồng ngang Khối lượng giặt: 9 kg Khối lượng sấy: 6 kg Tốc độ quay vắt: 1400 vòng/phút Hiệu suất sử dụng điện:  Kiểu động cơ: Truyền động gián tiếp (dây Curoa) Inverter: Có Công nghệ giặt Chương trình hoạt động: 16 chương trình Công nghệ giặt: Cảm biến Econavi, Giặt diệt khuẩn bằng nước lạnh UV Blue Ag+, Hệ thống ActiveFoam Tiện ích: Có sấy, Khóa trẻ em, Tự động vệ sinh lồng giặt Tổng quan Chất liệu lồng giặt: Thép không gỉ Chất liệu vỏ máy: Kim loại sơn tĩnh điện Chất liệu nắp máy: Kính chịu lực Bảng điều khiển: Song ngữ Anh-Việt Số người sử dụng: Từ 9 - 10 Kg (5-7 Người) Kích thước - Khối lượng: Cao 84.5 cm - Ngang 59.6 cm - Sâu 62 cm - Nặng 70 kg Nơi sản xuất: Việt nam Năm ra mắt: 2022 Bảo hành: 24 tháng', 'matgiatpanasonicnas96.png', '2023-04-03 12:53:06', 1, 4, 3);
INSERT INTO `sanpham` VALUES (42, 'Máy giặt Panasonic NAV10', 'Loại máy giặt: Cửa trước Lồng giặt: Lồng ngang Khối lượng giặt: 10 kg Tốc độ quay vắt: 1400 vòng/phút Hiệu suất sử dụng điện: 14.1 Wh/kg Kiểu động cơ: Truyền động dây Curoa Inverter: Có Công nghệ giặt Chương trình hoạt động: 10 Chương trình Công nghệ giặt: Giặt diệt khuẩn bằng nước lạnh UV Blue Ag+, Giặt ngăn ngừa dị ứng Allergy, Hệ thống ActiveFoam, Cảm biến Econavi, Giặt nước nóng StainMaster+ Tiện ích: Giặt nước nóng, Khóa trẻ em, Công nghệ Inverter - Tiết kiệm điện, Vệ sinh lồng giặt, Hẹn giờ giặt xong, Vắt cực khô Tổng quan Chất liệu lồng giặt: Thép không gỉ Chất liệu vỏ máy: Kim loại sơn tĩnh điện Chất liệu nắp máy: Nhựa Bảng điều khiển: Song ngữ Anh - Việt có nút xoay, nút nhấn và màn hình hiển thị Số người sử dụng: Từ trên 6 người (Trên 8.5 kg) Kích thước - Khối lượng: Cao 84.5 cm - Ngang 59.6 cm - Sâu 60 cm - Nặng 75 kg Nơi sản xuất: Việt Nam Năm sản xuất: 2019 Bảo hành: 24 tháng', 'maygiatpanasonicnav10.png', '2023-04-03 12:53:25', 1, 4, 3);
INSERT INTO `sanpham` VALUES (43, 'Máy giặt Samsung WA22R88', 'Loại máy giặt: Máy giặt cửa trên Lồng giặt: Lồng đứng Khối lượng giặt: 22 Kg Tốc độ quay vắt: 700 vòng/phút Lượng nước tiêu thụ chuẩn: Hiệu suất sử dụng điện: Kiểu động cơ: Truyền động dây Curoa Inverter: Có Công nghệ giặt Chương trình hoạt động: 6 chương trình Công nghệ giặt: Công nghệ Magic Clean giặt nước nóng diệt khuẩn mức 40 và 60 độ C, Công nghệ Intensive Wash đánh tan xà phòng giúp tăng khả năng thẩm thấu vào sợi vải, Bộ lọc xơ vải Magic Filter, Hộp đánh tan bột giặt Magic Dispenser, Mâm giặt Wobble tạo luồng nước đa chiều, Công nghệ giặt Activ Dualwash Tiện ích: Điều khiển bằng smartphone qua ứng dụng SmartThings, Giặt nước nóng, Khóa trẻ em, Công nghệ Inverter tiết kiệm điện, Tự khởi động lại khi có điện, Vệ sinh lồng giặt, Hẹn giờ giặt xong Tổng quan Chất liệu lồng giặt: Thép không gỉ Chất liệu vỏ máy: Kim loại sơn tĩnh điện Chất liệu nắp máy: Kính chịu lực Bảng điều khiển: Song ngữ Anh-Việt cảm ứng có màn hình hiển thị Số người sử dụng: Từ trên 6 người (Trên 8.5 kg) Kích th', 'maygiat1.png', '2023-04-03 12:53:46', 1, 8, 3);
INSERT INTO `sanpham` VALUES (44, 'Máy giặt Samsung WW10TP5', 'Loại máy giặt: Cửa trước Lồng giặt: Lồng ngang Khối lượng giặt: Giặt 10Kg Tốc độ quay vắt: 1400 vòng/phút Hiệu suất sử dụng điện:  Kiểu động cơ: Truyền động dây coroa Inverter: Có Công nghệ giặt Chương trình hoạt động:  Công nghệ giặt: Cửa phụ Add door, QuickDrive giặt xả hiệu quả chỉ trong 39 phút, Công nghệ giặt bong bóng Eco Bubble Tiện ích: Tổng quan Chất liệu lồng giặt: Thép không gỉ Chất liệu vỏ máy: Thép chống gỉ Chất liệu nắp máy: Kính chịu lực Bảng điều khiển: Tiếng Việt Số người sử dụng: Từ 5-7 người Kích thước - Khối lượng: Ngang 60 cm - Cao 85 cm - Sâu 55 cm - Nặng 67 kg Nơi sản xuất: Việt Nam Năm sản xuất: 2021 Bảo hành: 24 tháng', 'maygiat2.png', '2023-04-03 12:54:05', 1, 1, 3);
INSERT INTO `sanpham` VALUES (45, 'Điều hòa LG B24END1', 'Công suất làm lạnh: 24.000 BTU Công suất sưởi ấm: 26.000BTU Phạm vi làm lạnh hiệu quả: Từ 30-40m² Công nghệ Inverter: Điều hòa inverter Loại máy: Điều hoà 1 chiều (chỉ làm lạnh) Tính Năng Tiện ích:Chức năng tự chẩn đoán lỗi, Chức năng tự làm sạch, Có tự điều chỉnh nhiệt độ (chế độ ngủ đêm), Công nghệ Gold-Fin chống ăn mòn, Làm lạnh nhanh tức thì, Màn hình hiển thị nhiệt độ trên dàn lạnh, Thổi gió dễ chịu Comfort Air (cho trẻ em, người già), Tự khởi động lại khi có điện, Đảo gió 4 chiều giúp hơi lạnh lan toả đồng đều Công nghệ tiết kiệm điện: Dual inverter Kháng khuẩn khử mùi: Màng lọc sơ cấp Chế độ làm lạnh nhanh: Jet Cool Chế độ gió:Tuỳ chỉnh điều khiển lên xuống trái phải tự động  Thông tin chung Thông tin cục lạnh: Dài 99.8 cm - Cao 34.5 cm - Dày 21 cm - Nặng 11 kg Thông tin cục nóng: Dài 87 cm - Cao 65 cm - Dày 33 cm - Nặng 43 kg Loại Gas sử dụng: R32 Nơi sản xuất: Thái Lan Năm ra mắt: 2022 Bảo hành: 24 tháng', 'dh1.png', '2023-04-03 12:54:27', 1, 5, 4);
INSERT INTO `sanpham` VALUES (46, 'Điều hòa LG B18END1', 'Tổng quan Công suất làm lạnh: 18.000 BTU Công suất sưởi ấm: 19000BTU Phạm vi làm lạnh hiệu quả: Từ 20-30m² Công nghệ Inverter: Điều hòa inverter Loại máy: Điều hoà 1 chiều (chỉ làm lạnh) Tính Năng Tiện ích:Chức năng tự chẩn đoán lỗi, Chức năng tự làm sạch, Có tự điều chỉnh nhiệt độ (chế độ ngủ đêm), Công nghệ Gold-Fin chống ăn mòn, Làm lạnh nhanh tức thì, Màn hình hiển thị nhiệt độ trên dàn lạnh, Thổi gió dễ chịu Comfort Air (cho trẻ em, người già), Tự khởi động lại khi có điện, Đảo gió 4 chiều giúp hơi lạnh lan toả đồng đều Công nghệ tiết kiệm điện: Dual inverter Kháng khuẩn khử mùi: Màng lọc sơ cấp Chế độ làm lạnh nhanh: Jet Cool Chế độ gió:Tuỳ chỉnh điều khiển lên xuống trái phải tự động  Thông tin chung Thông tin cục lạnh: Dài 99.8cm - Cao 34.5 cm - Dày 21 cm - Nặng 11 kg Thông tin cục nóng: Dài 87 cm - Cao 65 cm - Dày 33 cm - Nặng 43 kg Loại Gas sử dụng: R32 Nơi sản xuất: Thái Lan Năm ra mắt: 2022 Bảo hành: 24 tháng', 'dh2.png', '2023-04-03 12:54:48', 1, 5, 4);
INSERT INTO `sanpham` VALUES (47, 'Google Tivi Sony XR65A', 'Hệ điều hành, giao diện: Google TV Remote thông minh: Remote tích hợp tích micro tìm kiếm giọng nói (RMF-TX800P) Chiếu hình từ điện thoại lên TV: AirPlay 2, Chromecast Điều khiển tivi bằng điện thoại: Ứng dụng Android TV Kết nối ứng dụng các thiết bị trong nhà: Đang cập nhật Điều khiển bằng giọng nói: Tìm kiếm giọng nói trên YouTube bằng tiếng Việt, Google Assistant có tiếng Việt Tiện ích thông minh khác: Micro tích hợp trên TV điều khiển giọng nói rảnh tay, Bravia CAM (mua thêm camera)', 'googletivisonyxr65a.png', '2023-04-03 12:55:07', 1, 6, 1);
INSERT INTO `sanpham` VALUES (48, 'Điều hòa LG B13END1', 'Tổng quan Công suất làm lạnh: 1 HP - 12.000 BTU Công suất sưởi ấm: 12800BTU Phạm vi làm lạnh hiệu quả: Từ 15 - 20m² (từ 40 đến 60 m³) Công nghệ Inverter: Điều hòa inverter Loại máy: Điều hoà 1 chiều (chỉ làm lạnh) Tính Năng Tiện ích:Chức năng tự chẩn đoán lỗi, Chức năng tự làm sạch, Có tự điều chỉnh nhiệt độ (chế độ ngủ đêm), Công nghệ Gold-Fin chống ăn mòn, Làm lạnh nhanh tức thì, Màn hình hiển thị nhiệt độ trên dàn lạnh, Thổi gió dễ chịu Comfort Air (cho trẻ em, người già), Tự khởi động lại khi có điện, Đảo gió 4 chiều giúp hơi lạnh lan toả đồng đều Công nghệ tiết kiệm điện: Dual inverter Kháng khuẩn khử mùi: Màng lọc sơ cấp Chế độ làm lạnh nhanh: Jet Cool Chế độ gió:Tuỳ chỉnh điều khiển lên xuống trái phải tự động  Thông tin chung Thông tin cục lạnh: Dài 82 cm - Cao 29 cm - Dày 19 cm - Nặng 8.5 kg Thông tin cục nóng: Dài 72 cm - Cao 50 cm - Dày 23 cm - Nặng 24.7 kg Loại Gas sử dụng: R32 Nơi sản xuất: Thái Lan Năm ra mắt: 2022 Bảo hành: 24 tháng', 'dh3.png', '2023-04-03 12:55:36', 1, 5, 4);
INSERT INTO `sanpham` VALUES (49, 'Google Tivi Sony KD55X', 'Hệ điều hành, giao diện: Google TV Remote thông minh: Remote tích hợp tích micro tìm kiếm giọng nói (RMF-TX800P) Chiếu hình từ điện thoại lên TV: AirPlay 2, Chromecast Điều khiển tivi bằng điện thoại: Ứng dụng Android TV Điều khiển bằng giọng nói: Google Assistant có tiếng Việt, Tìm kiếm giọng nói trên YouTube bằng tiếng Việt Tiện ích thông minh khác: Bravia CAM (mua thêm camera), Micro tích hợp trên TV điều khiển giọng nói rảnh tay', 'googletivisonykd55x.png', '2023-04-03 12:56:00', 1, 6, 1);
INSERT INTO `sanpham` VALUES (50, 'Android Tivi Mini TCL 65X', 'Lỗi máy giặt bị lệch tâm sẽ dẫn đến hiện tượng quần áo bị xoắn rối, quấn hoặc dẫn đấn rách quần áo. Hơn thế đối với lỗi máy giặt bị lệch tâm như vậy dẫn đến tiếng ồn lớn mang đến cảm giác khó chịu và ảnh hưởng xấu tới các linh kiện bên trong máy. Vậy Nguyên nhân, tác hại và cách khắc phục lỗi máy giặt bị lệch tâm? Hệ điều hành, giao diện: Android 9.0 Remote thông minh: Remote tích hợp micro tìm kiếm bằng giọng nói Chiếu hình từ điện thoại lên TV: Chromecast, Screen Mirroring, T-Cast Điều khiển tivi bằng điện thoại: Ứng dụng Google Cast, Ứng dụng MagiConnect Kết nối ứng dụng các thiết bị trong nhà: Không Điều khiển bằng giọng nói: Tìm kiếm giọng nói trên YouTube bằng tiếng Việt, Google Assistant có tiếng Việt Tiện ích thông minh khác: Micro tích hợp trên TV điều khiển giọng nói rảnh tay', 'Androidtiviminitcl65x.png', '2023-04-03 12:56:35', 1, 7, 1);
INSERT INTO `sanpham` VALUES (51, 'Smart Tivi Samsung NEO QLE', 'Smart Tivi Neo QLED Samsung 4K 55 inch QA55QN90C là phiên bản tivi 55 inch mới được nhà sản xuất Hàn Quốc đưa tới thị trường Việt Nam năm 2023. Sản phẩm không chỉ được trang bị màn hình NEO QLED cao cấp mà các tính năng khác cũng thuộc hàng hiện đại hàng đầu.', 'smarttivisamsungneoQLED4k.png', '2023-05-03 17:12:11', 1, 1, 1);

-- ----------------------------
-- Table structure for slide
-- ----------------------------
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Anh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TrangThai` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of slide
-- ----------------------------
INSERT INTO `slide` VALUES (1, 'slider11_bg.jpg', 1);
INSERT INTO `slide` VALUES (2, 'slider12_bg.jpg', 1);

-- ----------------------------
-- Table structure for thongso
-- ----------------------------
DROP TABLE IF EXISTS `thongso`;
CREATE TABLE `thongso`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MoTa` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IDSanPham` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `ThongSo_SanPham_IDSanPham`(`IDSanPham`) USING BTREE,
  CONSTRAINT `ThongSo_SanPham_IDSanPham` FOREIGN KEY (`IDSanPham`) REFERENCES `sanpham` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 401 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of thongso
-- ----------------------------
INSERT INTO `thongso` VALUES (1, 'Kích thước', '51 inch', 1);
INSERT INTO `thongso` VALUES (2, 'Màu sắc', 'Đen', 1);
INSERT INTO `thongso` VALUES (3, 'Chất lượng', '4k', 1);
INSERT INTO `thongso` VALUES (4, 'Hệ điều hành', 'Androi', 1);
INSERT INTO `thongso` VALUES (5, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 1);
INSERT INTO `thongso` VALUES (6, 'Công nghệ âm thanh', 'ClearAudio+', 1);
INSERT INTO `thongso` VALUES (7, 'Màn hình', 'Led+', 2);
INSERT INTO `thongso` VALUES (8, 'Kích thước', '55 inch', 2);
INSERT INTO `thongso` VALUES (9, 'Màu sắc', 'Đen', 2);
INSERT INTO `thongso` VALUES (10, 'Chất lượng', '4k', 2);
INSERT INTO `thongso` VALUES (11, 'Hệ điều hành', 'Androi', 2);
INSERT INTO `thongso` VALUES (12, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 2);
INSERT INTO `thongso` VALUES (13, 'Công nghệ âm thanh', 'ClearAudio+', 2);
INSERT INTO `thongso` VALUES (14, 'Màn hình', 'Led+', 2);
INSERT INTO `thongso` VALUES (15, 'Kích thước', '51 inch', 3);
INSERT INTO `thongso` VALUES (16, 'Màu sắc', 'Đen', 3);
INSERT INTO `thongso` VALUES (17, 'Chất lượng', '4k', 3);
INSERT INTO `thongso` VALUES (18, 'Hệ điều hành', 'Androi', 3);
INSERT INTO `thongso` VALUES (19, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 3);
INSERT INTO `thongso` VALUES (20, 'Công nghệ âm thanh', 'ClearAudio+', 3);
INSERT INTO `thongso` VALUES (21, 'Màn hình', 'Led+', 3);
INSERT INTO `thongso` VALUES (22, 'Kích thước', '51 inch', 4);
INSERT INTO `thongso` VALUES (23, 'Màu sắc', 'Đen', 4);
INSERT INTO `thongso` VALUES (24, 'Chất lượng', '4k', 4);
INSERT INTO `thongso` VALUES (25, 'Hệ điều hành', 'Androi', 4);
INSERT INTO `thongso` VALUES (26, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 4);
INSERT INTO `thongso` VALUES (27, 'Công nghệ âm thanh', 'ClearAudio+', 4);
INSERT INTO `thongso` VALUES (28, 'Màn hình', 'Led+', 4);
INSERT INTO `thongso` VALUES (29, 'Kích thước', '51 inch', 5);
INSERT INTO `thongso` VALUES (30, 'Màu sắc', 'Đen', 5);
INSERT INTO `thongso` VALUES (31, 'Chất lượng', '4k', 5);
INSERT INTO `thongso` VALUES (32, 'Hệ điều hành', 'Androi', 5);
INSERT INTO `thongso` VALUES (33, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 5);
INSERT INTO `thongso` VALUES (34, 'Công nghệ âm thanh', 'ClearAudio+', 5);
INSERT INTO `thongso` VALUES (35, 'Màn hình', 'Led+', 5);
INSERT INTO `thongso` VALUES (36, 'Kích thước', '51 inch', 6);
INSERT INTO `thongso` VALUES (37, 'Màu sắc', 'Đen', 6);
INSERT INTO `thongso` VALUES (38, 'Chất lượng', '4k', 6);
INSERT INTO `thongso` VALUES (39, 'Hệ điều hành', 'Androi', 6);
INSERT INTO `thongso` VALUES (40, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 6);
INSERT INTO `thongso` VALUES (41, 'Công nghệ âm thanh', 'ClearAudio+', 6);
INSERT INTO `thongso` VALUES (42, 'Màn hình', 'Led+', 6);
INSERT INTO `thongso` VALUES (43, 'Kích thước', '51 inch', 7);
INSERT INTO `thongso` VALUES (44, 'Màu sắc', 'Đen', 7);
INSERT INTO `thongso` VALUES (45, 'Chất lượng', '4k', 7);
INSERT INTO `thongso` VALUES (46, 'Hệ điều hành', 'Androi', 7);
INSERT INTO `thongso` VALUES (47, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 7);
INSERT INTO `thongso` VALUES (48, 'Công nghệ âm thanh', 'ClearAudio+', 7);
INSERT INTO `thongso` VALUES (49, 'Màn hình', 'Led+', 7);
INSERT INTO `thongso` VALUES (51, 'Kích thước', '51 inch', 8);
INSERT INTO `thongso` VALUES (52, 'Kích thước', '51 inch', 8);
INSERT INTO `thongso` VALUES (53, 'Kích thước', '51 inch', 8);
INSERT INTO `thongso` VALUES (54, 'Kích thước', '51 inch', 8);
INSERT INTO `thongso` VALUES (55, 'Kích thước', '51 inch', 8);
INSERT INTO `thongso` VALUES (56, 'Kích thước', '51 inch', 8);
INSERT INTO `thongso` VALUES (57, 'Kích thước', '51 inch', 8);
INSERT INTO `thongso` VALUES (58, 'Kích thước', '51 inch', 8);
INSERT INTO `thongso` VALUES (59, 'Kích thước', '51 inch', 8);
INSERT INTO `thongso` VALUES (60, 'Kích thước', '51 inch', 8);
INSERT INTO `thongso` VALUES (61, 'Màu sắc', 'Đen', 8);
INSERT INTO `thongso` VALUES (62, 'Chất lượng', '4k', 8);
INSERT INTO `thongso` VALUES (63, 'Hệ điều hành', 'Androi', 8);
INSERT INTO `thongso` VALUES (64, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 8);
INSERT INTO `thongso` VALUES (65, 'Công nghệ âm thanh', 'ClearAudio+', 8);
INSERT INTO `thongso` VALUES (66, 'Kích thước', '51 inch', 9);
INSERT INTO `thongso` VALUES (67, 'Màu sắc', 'Đen', 9);
INSERT INTO `thongso` VALUES (68, 'Chất lượng', '4k', 9);
INSERT INTO `thongso` VALUES (69, 'Hệ điều hành', 'Androi', 9);
INSERT INTO `thongso` VALUES (70, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 9);
INSERT INTO `thongso` VALUES (71, 'Công nghệ âm thanh', 'ClearAudio+', 9);
INSERT INTO `thongso` VALUES (72, 'Kích thước', '51 inch', 10);
INSERT INTO `thongso` VALUES (73, 'Màu sắc', 'Đen', 10);
INSERT INTO `thongso` VALUES (74, 'Chất lượng', '4k', 10);
INSERT INTO `thongso` VALUES (75, 'Hệ điều hành', 'Androi', 10);
INSERT INTO `thongso` VALUES (76, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 10);
INSERT INTO `thongso` VALUES (77, 'Công nghệ âm thanh', 'ClearAudio+', 10);
INSERT INTO `thongso` VALUES (78, 'Kích thước', '51 inch', 11);
INSERT INTO `thongso` VALUES (79, 'Màu sắc', 'Đen', 11);
INSERT INTO `thongso` VALUES (80, 'Chất lượng', '4k', 11);
INSERT INTO `thongso` VALUES (81, 'Hệ điều hành', 'Androi', 11);
INSERT INTO `thongso` VALUES (82, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 11);
INSERT INTO `thongso` VALUES (83, 'Công nghệ âm thanh', 'ClearAudio+', 11);
INSERT INTO `thongso` VALUES (84, 'Kích thước', '51 inch', 12);
INSERT INTO `thongso` VALUES (85, 'Màu sắc', 'Đen', 12);
INSERT INTO `thongso` VALUES (86, 'Chất lượng', '4k', 12);
INSERT INTO `thongso` VALUES (87, 'Hệ điều hành', 'Androi', 12);
INSERT INTO `thongso` VALUES (88, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 12);
INSERT INTO `thongso` VALUES (89, 'Công nghệ âm thanh', 'ClearAudio+', 12);
INSERT INTO `thongso` VALUES (90, 'Kích thước', '51 inch', 13);
INSERT INTO `thongso` VALUES (91, 'Màu sắc', 'Đen', 13);
INSERT INTO `thongso` VALUES (92, 'Chất lượng', '4k', 13);
INSERT INTO `thongso` VALUES (93, 'Hệ điều hành', 'Androi', 13);
INSERT INTO `thongso` VALUES (94, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 13);
INSERT INTO `thongso` VALUES (95, 'Công nghệ âm thanh', 'ClearAudio+', 13);
INSERT INTO `thongso` VALUES (96, 'Kích thước', '51 inch', 14);
INSERT INTO `thongso` VALUES (97, 'Màu sắc', 'Đen', 14);
INSERT INTO `thongso` VALUES (98, 'Chất lượng', '4k', 14);
INSERT INTO `thongso` VALUES (99, 'Hệ điều hành', 'Androi', 14);
INSERT INTO `thongso` VALUES (100, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 14);
INSERT INTO `thongso` VALUES (101, 'Công nghệ âm thanh', 'ClearAudio+', 14);
INSERT INTO `thongso` VALUES (102, 'Kích thước', '51 inch', 15);
INSERT INTO `thongso` VALUES (103, 'Màu sắc', 'Đen', 15);
INSERT INTO `thongso` VALUES (104, 'Chất lượng', '4k', 15);
INSERT INTO `thongso` VALUES (105, 'Hệ điều hành', 'Androi', 15);
INSERT INTO `thongso` VALUES (106, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 15);
INSERT INTO `thongso` VALUES (107, 'Công nghệ âm thanh', 'ClearAudio+', 15);
INSERT INTO `thongso` VALUES (108, 'Kích thước', '51 inch', 16);
INSERT INTO `thongso` VALUES (109, 'Màu sắc', 'Đen', 16);
INSERT INTO `thongso` VALUES (110, 'Chất lượng', '4k', 16);
INSERT INTO `thongso` VALUES (111, 'Hệ điều hành', 'Androi', 16);
INSERT INTO `thongso` VALUES (112, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 16);
INSERT INTO `thongso` VALUES (113, 'Công nghệ âm thanh', 'ClearAudio+', 16);
INSERT INTO `thongso` VALUES (114, 'Kích thước', '51 inch', 17);
INSERT INTO `thongso` VALUES (115, 'Màu sắc', 'Đen', 17);
INSERT INTO `thongso` VALUES (116, 'Chất lượng', '4k', 17);
INSERT INTO `thongso` VALUES (117, 'Hệ điều hành', 'Androi', 17);
INSERT INTO `thongso` VALUES (118, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 17);
INSERT INTO `thongso` VALUES (119, 'Công nghệ âm thanh', 'ClearAudio+', 17);
INSERT INTO `thongso` VALUES (120, 'Kích thước', '51 inch', 18);
INSERT INTO `thongso` VALUES (121, 'Màu sắc', 'Đen', 18);
INSERT INTO `thongso` VALUES (122, 'Chất lượng', '4k', 18);
INSERT INTO `thongso` VALUES (123, 'Hệ điều hành', 'Androi', 18);
INSERT INTO `thongso` VALUES (124, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 18);
INSERT INTO `thongso` VALUES (125, 'Công nghệ âm thanh', 'ClearAudio+', 18);
INSERT INTO `thongso` VALUES (126, 'Kích thước', '51 inch', 19);
INSERT INTO `thongso` VALUES (127, 'Màu sắc', 'Đen', 19);
INSERT INTO `thongso` VALUES (128, 'Chất lượng', '4k', 19);
INSERT INTO `thongso` VALUES (129, 'Hệ điều hành', 'Androi', 19);
INSERT INTO `thongso` VALUES (130, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 19);
INSERT INTO `thongso` VALUES (131, 'Công nghệ âm thanh', 'ClearAudio+', 19);
INSERT INTO `thongso` VALUES (132, 'Kích thước', '51 inch', 20);
INSERT INTO `thongso` VALUES (133, 'Màu sắc', 'Đen', 20);
INSERT INTO `thongso` VALUES (134, 'Chất lượng', '4k', 20);
INSERT INTO `thongso` VALUES (135, 'Hệ điều hành', 'Androi', 20);
INSERT INTO `thongso` VALUES (136, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 20);
INSERT INTO `thongso` VALUES (137, 'Công nghệ âm thanh', 'ClearAudio+', 20);
INSERT INTO `thongso` VALUES (138, 'Kích thước', '51 inch', 21);
INSERT INTO `thongso` VALUES (139, 'Màu sắc', 'Đen', 21);
INSERT INTO `thongso` VALUES (140, 'Chất lượng', '4k', 21);
INSERT INTO `thongso` VALUES (141, 'Hệ điều hành', 'Androi', 21);
INSERT INTO `thongso` VALUES (142, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 21);
INSERT INTO `thongso` VALUES (143, 'Công nghệ âm thanh', 'ClearAudio+', 21);
INSERT INTO `thongso` VALUES (144, 'Kích thước', '51 inch', 22);
INSERT INTO `thongso` VALUES (145, 'Màu sắc', 'Đen', 22);
INSERT INTO `thongso` VALUES (146, 'Chất lượng', '4k', 22);
INSERT INTO `thongso` VALUES (147, 'Hệ điều hành', 'Androi', 22);
INSERT INTO `thongso` VALUES (148, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 22);
INSERT INTO `thongso` VALUES (149, 'Công nghệ âm thanh', 'ClearAudio+', 22);
INSERT INTO `thongso` VALUES (151, 'Kích thước', '51 inch', 24);
INSERT INTO `thongso` VALUES (152, 'Màu sắc', 'Đen', 24);
INSERT INTO `thongso` VALUES (153, 'Chất lượng', '4k', 24);
INSERT INTO `thongso` VALUES (154, 'Hệ điều hành', 'Androi', 24);
INSERT INTO `thongso` VALUES (155, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 24);
INSERT INTO `thongso` VALUES (156, 'Công nghệ âm thanh', 'ClearAudio+', 24);
INSERT INTO `thongso` VALUES (157, 'Kích thước', '51 inch', 25);
INSERT INTO `thongso` VALUES (158, 'Màu sắc', 'Đen', 25);
INSERT INTO `thongso` VALUES (159, 'Chất lượng', '4k', 25);
INSERT INTO `thongso` VALUES (160, 'Hệ điều hành', 'Androi', 25);
INSERT INTO `thongso` VALUES (161, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 25);
INSERT INTO `thongso` VALUES (162, 'Công nghệ âm thanh', 'ClearAudio+', 25);
INSERT INTO `thongso` VALUES (163, 'Kích thước', '51 inch', 26);
INSERT INTO `thongso` VALUES (164, 'Màu sắc', 'Đen', 26);
INSERT INTO `thongso` VALUES (165, 'Chất lượng', '4k', 26);
INSERT INTO `thongso` VALUES (166, 'Hệ điều hành', 'Androi', 26);
INSERT INTO `thongso` VALUES (167, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 26);
INSERT INTO `thongso` VALUES (168, 'Công nghệ âm thanh', 'ClearAudio+', 26);
INSERT INTO `thongso` VALUES (169, 'Kích thước', '51 inch', 27);
INSERT INTO `thongso` VALUES (170, 'Màu sắc', 'Đen', 27);
INSERT INTO `thongso` VALUES (171, 'Chất lượng', '4k', 27);
INSERT INTO `thongso` VALUES (172, 'Hệ điều hành', 'Androi', 27);
INSERT INTO `thongso` VALUES (173, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 27);
INSERT INTO `thongso` VALUES (174, 'Công nghệ âm thanh', 'ClearAudio+', 27);
INSERT INTO `thongso` VALUES (175, 'Kích thước', '51 inch', 28);
INSERT INTO `thongso` VALUES (176, 'Màu sắc', 'Đen', 28);
INSERT INTO `thongso` VALUES (177, 'Chất lượng', '4k', 28);
INSERT INTO `thongso` VALUES (178, 'Hệ điều hành', 'Androi', 28);
INSERT INTO `thongso` VALUES (179, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 28);
INSERT INTO `thongso` VALUES (180, 'Công nghệ âm thanh', 'ClearAudio+', 28);
INSERT INTO `thongso` VALUES (181, 'Kích thước', '51 inch', 29);
INSERT INTO `thongso` VALUES (182, 'Màu sắc', 'Đen', 29);
INSERT INTO `thongso` VALUES (183, 'Chất lượng', '4k', 29);
INSERT INTO `thongso` VALUES (184, 'Hệ điều hành', 'Androi', 29);
INSERT INTO `thongso` VALUES (185, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 29);
INSERT INTO `thongso` VALUES (186, 'Công nghệ âm thanh', 'ClearAudio+', 29);
INSERT INTO `thongso` VALUES (187, 'Kích thước', '51 inch', 30);
INSERT INTO `thongso` VALUES (188, 'Kích thước', '51 inch', 30);
INSERT INTO `thongso` VALUES (189, 'Màu sắc', 'Đen', 30);
INSERT INTO `thongso` VALUES (190, 'Màu sắc', 'Đen', 30);
INSERT INTO `thongso` VALUES (191, 'Chất lượng', '4k', 30);
INSERT INTO `thongso` VALUES (192, 'Chất lượng', '4k', 30);
INSERT INTO `thongso` VALUES (193, 'Hệ điều hành', 'Androi', 30);
INSERT INTO `thongso` VALUES (194, 'Hệ điều hành', 'Androi', 30);
INSERT INTO `thongso` VALUES (195, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 30);
INSERT INTO `thongso` VALUES (196, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 30);
INSERT INTO `thongso` VALUES (197, 'Công nghệ âm thanh', 'ClearAudio+', 30);
INSERT INTO `thongso` VALUES (198, 'Công nghệ âm thanh', 'ClearAudio+', 30);
INSERT INTO `thongso` VALUES (199, 'Kích thước', '51 inch', 31);
INSERT INTO `thongso` VALUES (200, 'Màu sắc', 'Đen', 31);
INSERT INTO `thongso` VALUES (201, 'Chất lượng', '4k', 31);
INSERT INTO `thongso` VALUES (202, 'Hệ điều hành', 'Androi', 31);
INSERT INTO `thongso` VALUES (203, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 31);
INSERT INTO `thongso` VALUES (204, 'Công nghệ âm thanh', 'ClearAudio+', 31);
INSERT INTO `thongso` VALUES (205, 'Kích thước', '51 inch', 32);
INSERT INTO `thongso` VALUES (206, 'Màu sắc', 'Đen', 32);
INSERT INTO `thongso` VALUES (207, 'Chất lượng', '4k', 32);
INSERT INTO `thongso` VALUES (208, 'Hệ điều hành', 'Androi', 32);
INSERT INTO `thongso` VALUES (209, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 32);
INSERT INTO `thongso` VALUES (210, 'Công nghệ âm thanh', 'ClearAudio+', 32);
INSERT INTO `thongso` VALUES (211, 'Kích thước', '51 inch', 33);
INSERT INTO `thongso` VALUES (212, 'Màu sắc', 'Đen', 33);
INSERT INTO `thongso` VALUES (213, 'Chất lượng', '4k', 33);
INSERT INTO `thongso` VALUES (214, 'Hệ điều hành', 'Androi', 33);
INSERT INTO `thongso` VALUES (215, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 33);
INSERT INTO `thongso` VALUES (216, 'Công nghệ âm thanh', 'ClearAudio+', 33);
INSERT INTO `thongso` VALUES (217, 'Kích thước', '51 inch', 34);
INSERT INTO `thongso` VALUES (218, 'Màu sắc', 'Đen', 34);
INSERT INTO `thongso` VALUES (219, 'Chất lượng', '4k', 34);
INSERT INTO `thongso` VALUES (220, 'Hệ điều hành', 'Androi', 34);
INSERT INTO `thongso` VALUES (221, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 34);
INSERT INTO `thongso` VALUES (222, 'Công nghệ âm thanh', 'ClearAudio+', 34);
INSERT INTO `thongso` VALUES (223, 'Kích thước', '51 inch', 35);
INSERT INTO `thongso` VALUES (224, 'Màu sắc', 'Đen', 35);
INSERT INTO `thongso` VALUES (225, 'Chất lượng', '4k', 35);
INSERT INTO `thongso` VALUES (226, 'Hệ điều hành', 'Androi', 35);
INSERT INTO `thongso` VALUES (227, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 35);
INSERT INTO `thongso` VALUES (228, 'Công nghệ âm thanh', 'ClearAudio+', 35);
INSERT INTO `thongso` VALUES (229, 'Kích thước', '51 inch', 36);
INSERT INTO `thongso` VALUES (230, 'Màu sắc', 'Đen', 36);
INSERT INTO `thongso` VALUES (231, 'Chất lượng', '4k', 36);
INSERT INTO `thongso` VALUES (232, 'Hệ điều hành', 'Androi', 36);
INSERT INTO `thongso` VALUES (233, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 36);
INSERT INTO `thongso` VALUES (234, 'Công nghệ âm thanh', 'ClearAudio+', 36);
INSERT INTO `thongso` VALUES (235, 'Kích thước', '51 inch', 37);
INSERT INTO `thongso` VALUES (236, 'Màu sắc', 'Đen', 37);
INSERT INTO `thongso` VALUES (237, 'Chất lượng', '4k', 37);
INSERT INTO `thongso` VALUES (238, 'Hệ điều hành', 'Androi', 37);
INSERT INTO `thongso` VALUES (239, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 37);
INSERT INTO `thongso` VALUES (240, 'Công nghệ âm thanh', 'ClearAudio+', 37);
INSERT INTO `thongso` VALUES (241, 'Kích thước', '51 inch', 38);
INSERT INTO `thongso` VALUES (242, 'Màu sắc', 'Đen', 38);
INSERT INTO `thongso` VALUES (243, 'Chất lượng', '4k', 38);
INSERT INTO `thongso` VALUES (244, 'Hệ điều hành', 'Androi', 38);
INSERT INTO `thongso` VALUES (245, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 38);
INSERT INTO `thongso` VALUES (246, 'Công nghệ âm thanh', 'ClearAudio+', 38);
INSERT INTO `thongso` VALUES (247, 'Kích thước', '51 inch', 39);
INSERT INTO `thongso` VALUES (248, 'Màu sắc', 'Đen', 39);
INSERT INTO `thongso` VALUES (249, 'Chất lượng', '4k', 39);
INSERT INTO `thongso` VALUES (250, 'Hệ điều hành', 'Androi', 39);
INSERT INTO `thongso` VALUES (251, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 39);
INSERT INTO `thongso` VALUES (252, 'Công nghệ âm thanh', 'ClearAudio+', 39);
INSERT INTO `thongso` VALUES (253, 'Kích thước', '51 inch', 40);
INSERT INTO `thongso` VALUES (254, 'Màu sắc', 'Đen', 40);
INSERT INTO `thongso` VALUES (255, 'Chất lượng', '4k', 40);
INSERT INTO `thongso` VALUES (256, 'Hệ điều hành', 'Androi', 40);
INSERT INTO `thongso` VALUES (257, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 40);
INSERT INTO `thongso` VALUES (258, 'Công nghệ âm thanh', 'ClearAudio+', 40);
INSERT INTO `thongso` VALUES (259, 'Kích thước', '51 inch', 41);
INSERT INTO `thongso` VALUES (260, 'Màu sắc', 'Đen', 41);
INSERT INTO `thongso` VALUES (261, 'Chất lượng', '4k', 41);
INSERT INTO `thongso` VALUES (262, 'Hệ điều hành', 'Androi', 41);
INSERT INTO `thongso` VALUES (263, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 41);
INSERT INTO `thongso` VALUES (264, 'Công nghệ âm thanh', 'ClearAudio+', 41);
INSERT INTO `thongso` VALUES (265, 'Kích thước', '51 inch', 42);
INSERT INTO `thongso` VALUES (266, 'Màu sắc', 'Đen', 42);
INSERT INTO `thongso` VALUES (267, 'Chất lượng', '4k', 42);
INSERT INTO `thongso` VALUES (268, 'Hệ điều hành', 'Androi', 42);
INSERT INTO `thongso` VALUES (269, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 42);
INSERT INTO `thongso` VALUES (270, 'Công nghệ âm thanh', 'ClearAudio+', 42);
INSERT INTO `thongso` VALUES (271, 'Kích thước', '51 inch', 43);
INSERT INTO `thongso` VALUES (272, 'Màu sắc', 'Đen', 43);
INSERT INTO `thongso` VALUES (273, 'Chất lượng', '4k', 43);
INSERT INTO `thongso` VALUES (274, 'Hệ điều hành', 'Androi', 43);
INSERT INTO `thongso` VALUES (275, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 43);
INSERT INTO `thongso` VALUES (276, 'Công nghệ âm thanh', 'ClearAudio+', 43);
INSERT INTO `thongso` VALUES (277, 'Kích thước', '51 inch', 44);
INSERT INTO `thongso` VALUES (278, 'Màu sắc', 'Đen', 44);
INSERT INTO `thongso` VALUES (279, 'Chất lượng', '4k', 44);
INSERT INTO `thongso` VALUES (280, 'Hệ điều hành', 'Androi', 44);
INSERT INTO `thongso` VALUES (281, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 44);
INSERT INTO `thongso` VALUES (282, 'Công nghệ âm thanh', 'ClearAudio+', 44);
INSERT INTO `thongso` VALUES (283, 'Kích thước', '51 inch', 45);
INSERT INTO `thongso` VALUES (284, 'Màu sắc', 'Đen', 45);
INSERT INTO `thongso` VALUES (285, 'Chất lượng', '4k', 45);
INSERT INTO `thongso` VALUES (286, 'Hệ điều hành', 'Androi', 45);
INSERT INTO `thongso` VALUES (287, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 45);
INSERT INTO `thongso` VALUES (288, 'Công nghệ âm thanh', 'ClearAudio+', 45);
INSERT INTO `thongso` VALUES (289, 'Kích thước', '51 inch', 46);
INSERT INTO `thongso` VALUES (290, 'Màu sắc', 'Đen', 46);
INSERT INTO `thongso` VALUES (291, 'Chất lượng', '4k', 46);
INSERT INTO `thongso` VALUES (292, 'Hệ điều hành', 'Androi', 46);
INSERT INTO `thongso` VALUES (293, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 46);
INSERT INTO `thongso` VALUES (294, 'Công nghệ âm thanh', 'ClearAudio+', 46);
INSERT INTO `thongso` VALUES (295, 'Kích thước', '51 inch', 47);
INSERT INTO `thongso` VALUES (296, 'Màu sắc', 'Đen', 47);
INSERT INTO `thongso` VALUES (297, 'Chất lượng', '4k', 47);
INSERT INTO `thongso` VALUES (298, 'Hệ điều hành', 'Androi', 47);
INSERT INTO `thongso` VALUES (299, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 47);
INSERT INTO `thongso` VALUES (300, 'Công nghệ âm thanh', 'ClearAudio+', 47);
INSERT INTO `thongso` VALUES (301, 'Kích thước', '51 inch', 48);
INSERT INTO `thongso` VALUES (302, 'Màu sắc', 'Đen', 48);
INSERT INTO `thongso` VALUES (303, 'Chất lượng', '4k', 48);
INSERT INTO `thongso` VALUES (304, 'Hệ điều hành', 'Androi', 48);
INSERT INTO `thongso` VALUES (305, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 48);
INSERT INTO `thongso` VALUES (306, 'Công nghệ âm thanh', 'ClearAudio+', 48);
INSERT INTO `thongso` VALUES (307, 'Kích thước', '51 inch', 49);
INSERT INTO `thongso` VALUES (308, 'Màu sắc', 'Đen', 49);
INSERT INTO `thongso` VALUES (309, 'Chất lượng', '4k', 49);
INSERT INTO `thongso` VALUES (310, 'Hệ điều hành', 'Androi', 49);
INSERT INTO `thongso` VALUES (311, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 49);
INSERT INTO `thongso` VALUES (312, 'Công nghệ âm thanh', 'ClearAudio+', 49);
INSERT INTO `thongso` VALUES (313, 'Kích thước', '51 inch', 50);
INSERT INTO `thongso` VALUES (314, 'Màu sắc', 'Đen', 50);
INSERT INTO `thongso` VALUES (315, 'Chất lượng', '4k', 50);
INSERT INTO `thongso` VALUES (316, 'Hệ điều hành', 'Androi', 50);
INSERT INTO `thongso` VALUES (317, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 50);
INSERT INTO `thongso` VALUES (318, 'Công nghệ âm thanh', 'ClearAudio+', 50);
INSERT INTO `thongso` VALUES (319, 'Kích thước', '51 inch', 51);
INSERT INTO `thongso` VALUES (320, 'Màu sắc', 'Đen', 51);
INSERT INTO `thongso` VALUES (321, 'Chất lượng', '4k', 51);
INSERT INTO `thongso` VALUES (322, 'Hệ điều hành', 'Androi', 51);
INSERT INTO `thongso` VALUES (323, 'Công nghệ hình ảnh', 'Supreme UHD Dimming', 51);
INSERT INTO `thongso` VALUES (324, 'Công nghệ âm thanh', 'ClearAudio+', 51);
INSERT INTO `thongso` VALUES (325, 'Màn hình', 'Led+', 51);

-- ----------------------------
-- Table structure for tintuc
-- ----------------------------
DROP TABLE IF EXISTS `tintuc`;
CREATE TABLE `tintuc`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TieuDe` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NoiDung` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `NgayDang` datetime(0) NULL DEFAULT NULL,
  `Anh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TrangThai` int NULL DEFAULT NULL,
  `IDNguoiDung` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `TinTuc_NguoiDung_IDNguoiDung`(`IDNguoiDung`) USING BTREE,
  CONSTRAINT `TinTuc_NguoiDung_IDNguoiDung` FOREIGN KEY (`IDNguoiDung`) REFERENCES `nguoidung` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tintuc
-- ----------------------------
INSERT INTO `tintuc` VALUES (1, 'Nguyên nhân, tác hại và cách khắc phục lỗi máy giặt bị lệch tâm', 'Lỗi máy giặt bị lệch tâm sẽ dẫn đến hiện tượng quần áo bị xoắn rối, quấn hoặc dẫn đấn rách quần áo. Hơn thế đối với lỗi máy giặt bị lệch tâm như vậy dẫn đến tiếng ồn lớn mang đến cảm giác khó chịu và ảnh hưởng xấu tới các linh kiện bên trong máy. Vậy Nguyên nhân, tác hại và cách khắc phục lỗi máy giặt bị lệch tâm? Bạn hãy cùng Điện Máy Mona tìm hiểu nhé. Khi máy giặt bị lệch tâm thì trong quá trình hoạt động máy sẽ có các dấu hiệu nhận biết như:\r\n\r\n Phát ra tiếng ồn lớn hơn so với bình thường, Lồng giặt rung lắc mạnh và va đạp và vỏ của máy giặt. N ài ra, khi máy giặt bị lệch tâm, quá trình giặt không ổn định khiến quần áo dễ bị nhăn, xoắn vào nhau, thậm chí còn bị rách. Nguyên nhân chủ yếu làm cho máy giặt bị lệch tâm là hoạt động quá tải trong thời gian dài. Đồng thời, máy giặt bị lệch tâm còn do một số nguyên nhân khác như sau: Vị trí đặt máy giặt không bằng phẳng khiến máy bị nghiêng, lệch, rung lắc khi hoạt động.\r\nDồn quần áo về một bên, quần áo quấn lại vào nhau và lệch về một bê', '2023-04-01 03:30:04', 'tintuc1.png', 1, 1);
INSERT INTO `tintuc` VALUES (2, 'Hướng Dẫn Khắc Phục Máy Giặt Bị Ngập Nước', 'Trời mưa lớn  gây ra nhiều bất tiện trọng cuộc sống của chúng ta có thể đẫn đến hiện tượng các thiết bị trong nhà bị nhập nước và gây hỏng hóc nếu không được xử lý kịp thời. Nếu nhà bạn máy giặt bị ngập nước mà không biết cách xử lý ntn thì bài viết dưới đây bạn hãy cùng Điện Máy Mona tìm hiểu Cách khắc phục máy giặt bị nhập nước nhé. Máy giặt là một thiết bị điện nếu bị ngập nước mà không được khắc phục hoặc xử lý kịp thời thì việc ngâm trong nước mữa sẽ làm cho chiếc máy bị hư hỏng nặng\r\nN ài ra sau khi máy bị ngâm nước mà chúng ta không vệ sinh sạch sẽ cẩn thận sẽ khiến cặn bẩn, vi khuẩn bám vào bên trong máy, ảnh hưởng chất lượng sử dụng. Khi phát hiện máy giặt có nguy cơ sắp bị ngập hoặc đang bị ngập nước, bạn nên nhanh chóng thực hiện những điều sau để bảo vệ máy. Vì nước là một chất dẫn điện nếu không ngắt điện kịp thời thì có thể dẫn đến tình trạng rò rỉ điện gây nguy hiểm cho những ai lại gần\r\nNếu trong trường hợp bạn không kịp ngắt nguồn điện thì trong suốt quá trình trước đó', '2023-04-02 03:30:04', 'tintuc2.png', 1, 1);
INSERT INTO `tintuc` VALUES (3, 'Giặt nước nóng và giặt hơi nước có gì khác nhau?', 'Giặt nước nóng hay giặt hơi nước đều mang đến khả năng diệt khuẩn tối ưu nhất trên quần áo, giảm khả năng nhăn nhàu và tăng hiệu quả giặt sạch quần áo một cách hiểu quả nhất. Bài viết dưới đây Điện Máy Mona sẽ giới thiệu và so sánh giữa 2 tính năng giặt này liệu có thực sự khác nhau không nhé? Chế độ giặt nước nóng trên máy giặt là gì?\r\nChế độ giặt nước nóng trên máy giặt là 1 chức năng giặt sử dụng nước nóng ở nhiệt độ từ  30 - 95 độ C. Khi bạn chọn chế độ giặt nước nóng thì nước sẽ được đun nóng đến nhiệt độ cài đặt rồi mới được chảy vào bên trong lồng giặt. Chế độ giặt nước nóng có những lợi ích như:\r\n\r\nHòa tan bột giặt nhanh chóng, giảm thiểu tình trạng đóng cặn trên quần áo.\r\nGóp phần loại bỏ vết bẩn cứng đầu (như vết nhờn dơ, vết dầu mỡ,…) dễ dàng hơn.\r\nDiệt khuẩn, loại bỏ những tác nhân gây dị ứng tối ưu, thích hợp cho người có làn da nhạy cảm.\r\nLàm quần áo trở nên mềm mại sau khi giặt, giúp người mặc cảm thấy thoải mái hơn.\r\n Chế độ giặt hơi nước là chế độ sử dụng hơi nước nóng', '2023-04-03 03:30:04', 'tintuc3.png', 1, 3);
INSERT INTO `tintuc` VALUES (4, 'Nguyên Nhân Và Cách Khắc Phục Máy Giặt LG Báo Lỗi FF', 'Trong quá trình sử dụng Máy Giặt LG bạn đã bao giờ gặp phải lỗi FF chưa. Nếu gặp phải lỗi FF trên máy giặt LG thì bạn cũng không cần lo lắng quá mà hãy thử tìm hiểu nguyên nhân và cách khắc phục lỗi FF này để tránh trường hợp làm máy hư hỏng nặng hơn nhé. Vậy làm thế nào để khắc phục lỗi FF này bạn hãy cùng Điện Máy Mona tìm hiểu nhé. Máy giặt LG báo lỗi FF là lỗi về chập đường cảm biến chống tràn. Lỗi FF thường xuất hiện trên các dòng máy giặt lồng ngang Inverter của hãng LG. Tuy nhiên, lỗi này cũng rất hiếm khi gặp phải. Khi máy giặt LG nhà bạn gặp phải lỗi FF, bạn nên nhanh chóng tìm hiểu nguyên nhân và đưa ra cách giải quyết để không làm hư hỏng quá nặng, đồng thời đáp ứng tốt nhu cầu sử dụng. Do vị trí để máy giặt quá ẩm ướt, thường xuyên bị nước ngập. Do thời tiết nồm, có độ ẩm quá cao dễ làm cho máy giặt LG bị nước vào. Máy giặt chịu tác động bên n ài dẫn đến hiện tượng thủng, rách dây dẫn cấp thoát nước. Dây dẫn có thể bị chuột hay côn trùng cắn. Máy không được vận chuyển đúng ', '2023-04-04 03:30:04', 'tintuc4.png', 1, 1);
INSERT INTO `tintuc` VALUES (5, '3 Mẫu Điều Hòa 12000BTU Bán Chạy Nhất Tháng 9/2022', 'Bạn đang muốn mua 1 bộ điều hòa 12000BTU cho căn phòng của mình. Nhưng bạn không biết chọn sản phẩm của hãng nào. Vậy bạn hãy cùng Điện Máy Người Việt tìm hiểu Top 3 điều hòa 12000BTU bán chạy nhất tháng 9/2022 này nhé.\r\n1. Điều hòa Mitsubishi MSY-JP35VF inverter 1 chiều 12000BTU - Giá 11.190.000VNĐ\r\nTrang bị lớp phủ kép chống bám bẩn giúp ngăn người tích tụ bụi bẩn, khói thuốc và dầu trên bề mặt giúp tạo ra luồng gió mạt lạnh và trong lành cho căn phòng.\r\nCông nghệ tiết kiện điện thông mình Econo Cool cho phép tự động điều chỉnh hướng gió giúp tăng hiệu quả tiết kiệm điện năng.\r\nTrang bị công nghệ vận hành thông mình Fuzzy logic \"i feel\" tự động chọn chế độ thích hợp theo nhiệt độ phòng.\r\n\r\n\r\n2. Điều hòa Panasonic CU/CS-XPU12XKH-8 1 chiều inverter 12000BTU - Giá 11.090.000VNĐ\r\nThiết kế hiện đại kết hợp với những đường nét thanh mảnh và tông màu trắng ngọc trại sẽ mang lại vẻ đẹp sang trọng cho không gian nội thất của gia đình bạn.\r\nĐiều hòa có công suất 12000BTU phù hợp với những căn ', '2023-04-05 03:30:04', 'tintuc5.png', 1, 1);
INSERT INTO `tintuc` VALUES (6, 'Nguyên nhân và cách khắc phục máy giặt Samsung báo lỗi UB', 'Sau một thời gian sử dụng vào một ngày đẹp trời chiếc máy giặt samsung nhà bạn gặp phải tình trạng máy không vắt và màn hình báo lỗi ký hiệu UB. Nếu gặp phải tình trạng như thế này thì bạn cũng không cần phải quá lo lắng vì đây là một trong những lỗi thường gặp phải trên máy giặt Samsung. bạn hãy cùng Điện Máy Người Việt tìm hiểu nguyên ngân và các sửa lỗi máy giặt Samsung báo lỗi UB nhé.\r\n1. Máy giặt Samsung báo lỗi UB là gì?\r\nLỗi UB là lỗi mà khi máy giặt hoàn thành chu trình giặt mà không thực hiện được chương trình vắt.\r\n\r\n\r\n\r\n2. Nguyên nhân máy giặt Samsung báo lỗi UB\r\nCó nhiều nguyên nhân làm cho máy giặt Samsung báo lỗi UB, nhưng chủ yếu là 2 nguyên nhân dưới đây:\r\n\r\nXuất hiện sự mất cân bằng bên trong lồng giặt, quần áo bị dồn về một phía.\r\nPhần cứng của máy giặt gặp sự cố lỗi, hư, hỏng làm cho chức năng vắt của máy không hoạt động được hoặc hoạt động được nhưng không triệt để.\r\n\r\n\r\n3. Cách khắc phục máy giặt Samsung báo lỗi UB\r\nDưới đây là cách khắc phục máy giặt Samsung báo l', '2023-04-06 03:30:04', 'tintuc6.png', 1, 3);
INSERT INTO `tintuc` VALUES (7, 'Vì Sao Nên Sử Dụng Chế Độ Giặt Nước Nóng Trên Máy Giặt?', 'Giặt quần áo bằng nước nóng giúp loại bỏ các tác nhân gây dị ứng trên và giúp đánh bay các vết bẩn cứng đầu hiệu quả. Bạn hãy cùng Điện Máy Người Việt tìm hiểu kĩ hơn vì sao nên sử dụng chế độ giặt nước nóng khi giặt quần áo trong bài viết này nhé.\r\n1. Chế độ giặt nước nóng trên máy giặt là gì?\r\nChế độ giặt nước nóng trên máy giặt là một tính năng chuyên dụng trên máy giặt. Tính năng này hoạt động như một chế độ giặt thông thường nhưng chỉ khác là sử dụng nước nóng từ 30 - 95 độ C thay vì nước lạnh.\r\nVới chế độ giặt nước nóng thì quần áo sẽ được loại bỏ vết bẩn dễ dàng hơn và đồng thời có thể khử được mùi hôi và diệt các tác nhân gây dị ứng.\r\nCơ chế hoạt động của chế độ này kết hợp 6 động tác giặt tay như: đập, nén, quay, nhào trộn, chà xát giúp quần áo thêm sạch sẽ hơn.\r\nCông nghệ giặt phun bằng hơi nước giúp tăng và giữ nhiệt độ bên trong thùng giặt nhanh chóng.\r\nChế độ giặt nước nóng trên máy giặt là gì?\r\n\r\nMáy giặt có chức năng làm sạch thùng giặt và kết hợp với chế độ giặt bằng nư', '2023-04-07 03:30:04', 'tintuc7.png', 1, 1);
INSERT INTO `tintuc` VALUES (8, 'Top 4 Smart Tivi LG kích thước lớn bán chạy tháng 7/2022', 'Bạn đang tìm kiếm một chiếc tivi kích thước lớn với tính năng cao, màn hình đẹp, thiết kế sang trọng. Đừng bỏ qua bài viết này, Điện Máy Người Việt sẽ giới thiệu cho các bạn Top 4 Smart Tivi LG inch lớn bán chạy tháng 7/2022 nhé !\r\n\r\n1.Smart tivi LG 65UP8100PTB 65 inch 4K\r\n\r\nSmart tivi LG 65UP8100PTB 65 inch 4K có thiết kế viền màn hình mỏng mang lại vẻ đẹp hiện đại và sang trong cho không gian nội thất tại nhà.\r\n\r\nSmart tivi LG 65UP8100PTB được trang bị bộ xử lý lõi tứ 4K giúp loại bỏ nhiễu và tăng cường màu sắc cũng như độ tương phản mang lại những hình ảnh rực rỡ và sống động. Hơn những thế với bộ xử lý lõi tứ 4K có thể nâng cấp và tái tạo hình ảnh ở độ phân giải thấp lên với gần 4K nhất mang lại những trải nghiệm vô xùng tuyệt vời.\r\n\r\n\r\n\r\nGiá : 16.690.000 ₫\r\n \r\n\r\n2. Smart tivi LG 70UP7800PTB 70 inch 4K\r\n\r\nSmart tivi LG 70UP7800PTB 70 inch 4K có thiết kế chân đế hình bán nguyệt ở chính giữ tivi kết hợp với tông màu đen mang lại về đẹp hiện đại kết hợp với những đường nét thiết kế gọ', '2023-04-08 03:30:04', 'tintuc8.png', 1, 1);
INSERT INTO `tintuc` VALUES (9, 'Hướng Dẫn Bật Âm Thanh Trên Máy Giặt LG Cực Đơn Giản', 'Máy giặt LG có thể phát ra âm thanh trong quá trình máy hoạt động giúp cho người sử dụng dễ dàng và tiện lợi trong quá trình sử dụng. Vậy để bật được âm thanh của máy giặt LG bạn hãy cùng Điện Máy Người Việt tìm hiểu nhé.\r\n1. Tại sao cần phải bật âm thanh trên máy giặt LG?\r\nHiện nay hầu hết các dòng sản phẩm máy giặt hiện nay đều có thể phát ra âm thanh khi người dùng sử dụng thiết bị. Việc bật âm thanh trên máy giặt giúp cho người sử dụng có nhiều lợi ích sau:\r\n\r\nBạn có thể nhận biết được máy đang hoạt động ở chức năng nào mà không cần nhìn vào bảng điều khiển.\r\nÂm thanh báo hiệu giúp bạn nhận biết được thiết bị đã hoàn thành chương trình giặt.\r\nTrong quá trình sử dụng, máy giặt xảy ra lỗi thì bạn có thể nhanh chóng nhận biết tức thì nhờ âm thanh máy phát ra.\r\nVới gia đình có trẻ nhỏ, trẻ vui chơi vô tình chạm vào các nút chức năng của máy thì phụ huynh có thể phát hiện để khắc phục được lỗi nhanh chóng.\r\n\r\n\r\n2. Cách bật âm thanh máy giặt LG    \r\nChức năng bật âm thanh trên máy giặt L', '2023-04-09 03:30:04', 'tintuc9.png', 1, 3);
INSERT INTO `tintuc` VALUES (10, 'iPhone 14 Plus là minh chứng cho sai lầm của Apple', 'Để mang tới cho người dùng một mẫu iPhone màn hình lớn nhưng với mức giá hợp lý, Apple đã ra mắt iPhone 14 Plus. Tuy nhiên, dường như đây lại là một sai lầm của Táo khuyết khi một số báo cáo cho thấy, iPhone 14 Plus có doanh số thấp hơn rất nhiều so với kỳ vọng.\r\n\r\nĐối với Apple, doanh số của dòng iPhone Mini trước đây đã được xem là đáng thất vọng. Do đó, iPhone Plus ra đời để thay thế cho dòng máy này và được với kỳ vọng đạt doanh số tốt hơn. Tuy nhiên, đây được cho là một tính toán sai lầm của Apple bởi lý do đơn giản là hai dòng sản phẩm này không thể thay thế lẫn nhau.\r\n\r\nChính kích thước nhỏ gọn của những chiếc iPhone Mini khiến cho chúng trở nên độc đáo hơn giữa thị trường smartphone. iPhone 13 Mini hiện vẫn được đánh giá là chiếc điện thoại nhỏ gọn mạnh mẽ nhất trên thị trường. Với những người dùng yêu thích điện thoại nhỏ gọn và sẵn sàng trả khoản chi phí cao để có được sản phẩm có hiệu suất hàng đầu, iPhone 13 Mini là sự lựa chọn không thể tốt hơn.\r\n\r\nTrong khi đó, iPhone 14 ', '2023-04-10 03:30:04', 'tintuc10.png', 1, 1);

-- ----------------------------
-- Procedure structure for sp_ctdonhang_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_ctdonhang_create`;
delimiter ;;
CREATE PROCEDURE `sp_ctdonhang_create`(IN p_soluong INT,
		IN p_gia INT,
		IN p_idsanpham INT,
    IN p_iddonhang INT)
BEGIN
    INSERT INTO ctdonhang (soluong, gia, idsanpham, iddonhang)
    VALUES (p_soluong, p_gia, p_idsanpham, p_iddonhang);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_ctdonhang_getbydonhang
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_ctdonhang_getbydonhang`;
delimiter ;;
CREATE PROCEDURE `sp_ctdonhang_getbydonhang`(IN p_id INT)
BEGIN
    SELECT c.*, s.ten AS TenSanPham, s.anh AS Anh
		FROM ctdonhang c 
		INNER JOIN sanpham s ON c.idsanpham = s.id
		WHERE c.iddonhang = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_ctdonhang_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_ctdonhang_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_ctdonhang_getbyid`(IN p_id INT)
BEGIN
    SELECT c.*, s.ten AS TenSanPham, s.anh AS Anh
		FROM ctdonhang c 
		INNER JOIN sanpham s ON c.idsanpham = s.id
		WHERE c.id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_cthoadonnhap_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_cthoadonnhap_create`;
delimiter ;;
CREATE PROCEDURE `sp_cthoadonnhap_create`(IN p_soluong INT,
		IN p_gia INT,
		IN p_idsanpham INT,
		IN p_idhoadonnhap INT)
BEGIN
    INSERT INTO cthoadonnhap (soluong, gia, idsanpham, idhoadonnhap)
    VALUES (p_soluong, p_gia, p_idsanpham, p_idhoadonnhap);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_cthoadonnhap_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_cthoadonnhap_delete`;
delimiter ;;
CREATE PROCEDURE `sp_cthoadonnhap_delete`(IN p_id INT)
BEGIN
    DELETE FROM cthoadonnhap WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_cthoadonnhap_getbyhoadonnhap
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_cthoadonnhap_getbyhoadonnhap`;
delimiter ;;
CREATE PROCEDURE `sp_cthoadonnhap_getbyhoadonnhap`(IN p_id INT)
BEGIN
    SELECT c.*, s.ten AS TenSanPham, s.anh AS Anh
		FROM cthoadonnhap c
		INNER JOIN sanpham s ON c.idsanpham = s.id
		WHERE c.idhoadonnhap = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_cthoadonnhap_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_cthoadonnhap_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_cthoadonnhap_getbyid`(IN p_id INT)
BEGIN
    SELECT c.*, s.ten AS TenSanPham, s.anh AS Anh
		FROM cthoadonnhap c
		INNER JOIN sanpham s ON c.idsanpham = s.id
		WHERE c.id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_cthoadonnhap_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_cthoadonnhap_update`;
delimiter ;;
CREATE PROCEDURE `sp_cthoadonnhap_update`(IN p_id INT,
		IN p_soluong INT,
		IN p_gia INT,
		IN p_idsanpham INT,
		IN p_idhoadonnhap INT)
BEGIN
    UPDATE cthoadonnhap 
    SET 
				soluong = IFNULL(p_soluong, soluong),
				gia = IFNULL(p_gia, gia),
				idsanpham = IFNULL(p_idsanpham, idsanpham),
				idhoadonnhap = IFNULL(p_idhoadonnhap, idhoadonnhap)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_ctkho_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_ctkho_create`;
delimiter ;;
CREATE PROCEDURE `sp_ctkho_create`(IN p_soluong INT,
		IN p_idsanpham INT,
    IN p_idkho INT)
BEGIN
    INSERT INTO ctkho (soluong, idsanpham, idkho)
    VALUES (p_soluong, p_idsanpham, p_idkho);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_ctkho_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_ctkho_delete`;
delimiter ;;
CREATE PROCEDURE `sp_ctkho_delete`(IN p_id INT)
BEGIN
    DELETE FROM ctkho WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_ctkho_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_ctkho_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_ctkho_getbyid`(IN p_id INT)
BEGIN
    SELECT c.*, s.ten AS TenSanPham, s.anh AS Anh
		FROM ctkho c 
		INNER JOIN sanpham s ON c.idsanpham = s.id
		WHERE c.id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_ctkho_getbykho
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_ctkho_getbykho`;
delimiter ;;
CREATE PROCEDURE `sp_ctkho_getbykho`(IN p_id INT)
BEGIN
    SELECT c.*, s.ten AS TenSanPham, s.anh AS Anh
		FROM ctkho c 
		INNER JOIN sanpham s ON c.idsanpham = s.id
		WHERE c.idkho = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_ctkho_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_ctkho_update`;
delimiter ;;
CREATE PROCEDURE `sp_ctkho_update`(IN p_id INT,
    IN p_soluong INT,
		IN p_idsanpham INT,
    IN p_idkho INT)
BEGIN
    UPDATE ctkho 
    SET 
        soluong = IFNULL(p_soluong, soluong),
				idsanpham = IFNULL(p_idsanpham, idsanpham),
				idkho = IFNULL(p_idkho, idkho)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_dieukhoan_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_dieukhoan_create`;
delimiter ;;
CREATE PROCEDURE `sp_dieukhoan_create`(IN p_noidung TEXT,
		IN p_kieu INT,
    IN p_trangthai INT)
BEGIN
    INSERT INTO dieukhoan (noidung, kieu, trangthai)
    VALUES (p_noidung, p_kieu, p_trangthai);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_dieukhoan_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_dieukhoan_delete`;
delimiter ;;
CREATE PROCEDURE `sp_dieukhoan_delete`(IN p_id INT)
BEGIN
    DELETE FROM dieukhoan WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_dieukhoan_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_dieukhoan_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_dieukhoan_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT,
    IN p_kieu INT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM dieukhoan WHERE IFNULL(p_kieu, kieu) = kieu;
    
    SELECT *, total_count AS TotalCount
    FROM dieukhoan 
    WHERE IFNULL(p_kieu, kieu) = kieu 
    ORDER BY ID DESC 
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_dieukhoan_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_dieukhoan_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_dieukhoan_getbyid`(IN p_id INT)
BEGIN
    SELECT * FROM dieukhoan WHERE ID = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_dieukhoan_getbykieu
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_dieukhoan_getbykieu`;
delimiter ;;
CREATE PROCEDURE `sp_dieukhoan_getbykieu`(IN p_kieu INT)
BEGIN
    SELECT * 
		FROM dieukhoan 
		WHERE kieu = p_kieu AND trangthai = 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_dieukhoan_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_dieukhoan_update`;
delimiter ;;
CREATE PROCEDURE `sp_dieukhoan_update`(IN p_id INT,
    IN p_noidung TEXT,
		IN p_kieu INT,
    IN p_trangthai INT)
BEGIN
    UPDATE dieukhoan 
    SET 
        noidung = IFNULL(p_noidung, noidung),
				kieu = IFNULL(p_kieu, kieu),
        trangthai = IFNULL(p_trangthai, trangthai)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_donhang_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_donhang_create`;
delimiter ;;
CREATE PROCEDURE `sp_donhang_create`(IN p_ten VARCHAR(255),
		IN p_diachi VARCHAR(255),
		IN p_sdt VARCHAR(255),
		IN p_kieugiaohang INT,
		IN p_ghichu VARCHAR(255),
		IN p_idphuongthuc INT,
		IN p_idnguoidung INT)
BEGIN
    INSERT INTO donhang (ten, diachi, sdt, ngaydat, kieugiaohang, ghichu, trangthai, idphuongthuc, idnguoidung)
    VALUES (p_ten, p_diachi, p_sdt, NOW(), p_kieugiaohang, p_ghichu, 0, p_idphuongthuc, p_idnguoidung);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_donhang_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_donhang_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_donhang_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT,
		IN p_trangthai INT)
BEGIN
		DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
		
		SELECT COUNT(*) INTO total_count FROM donhang;
		
		SELECT d.*, p.ten AS TenPhuongThuc, n.taikhoan AS TaiKhoan, CAST(SUM(c.gia * c.soluong) AS SIGNED) AS TongTien, total_count AS TotalCount
		FROM donhang d
		INNER JOIN phuongthucthanhtoan p ON d.idphuongthuc = p.id
		INNER JOIN ctdonhang c ON d.ID = c.IDDonHang
		INNER JOIN nguoidung n ON d.idnguoidung = n.id
		WHERE IFNULL(p_trangthai, d.trangthai) = d.trangthai 
		GROUP BY d.ID
		ORDER BY d.ngaydat DESC
		LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_donhang_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_donhang_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_donhang_getbyid`(IN p_id INT)
BEGIN
    SELECT d.*, p.ten AS TenPhuongThuc, n.taikhoan AS TaiKhoan, CAST(SUM(c.gia * c.soluong) AS SIGNED) AS TongTien
		FROM donhang d
		INNER JOIN phuongthucthanhtoan p ON d.idphuongthuc = p.id
		INNER JOIN ctdonhang c ON d.ID = c.IDDonHang
		INNER JOIN nguoidung n ON d.idnguoidung = n.id
		WHERE d.id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_donhang_getbynguoidung
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_donhang_getbynguoidung`;
delimiter ;;
CREATE PROCEDURE `sp_donhang_getbynguoidung`(IN p_pageindex INT,
    IN p_pagesize INT,
		IN p_id INT)
BEGIN
		DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
		
		SELECT COUNT(*) INTO total_count FROM donhang WHERE idnguoidung = p_id;
		
    SELECT d.*, p.ten AS TenPhuongThuc, CAST(SUM(c.gia * c.soluong) AS SIGNED) AS TongTien, total_count AS TotalCount
		FROM donhang d
		INNER JOIN phuongthucthanhtoan p ON d.idphuongthuc = p.id
		INNER JOIN ctdonhang c ON d.ID = c.IDDonHang
		WHERE d.idnguoidung = p_id
		GROUP BY d.ID, p.ten
		ORDER BY d.ngaydat DESC
		LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_donhang_getnew
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_donhang_getnew`;
delimiter ;;
CREATE PROCEDURE `sp_donhang_getnew`()
BEGIN
    SELECT d.id AS ID
		FROM donhang d
		ORDER BY ngaydat DESC
		LIMIT 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_donhang_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_donhang_update`;
delimiter ;;
CREATE PROCEDURE `sp_donhang_update`(IN p_id INT,
    IN p_trangthai INT)
BEGIN
    UPDATE donhang 
    SET 
				trangthai = IFNULL(p_trangthai, trangthai)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_giamgia_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_giamgia_create`;
delimiter ;;
CREATE PROCEDURE `sp_giamgia_create`(IN p_phantram INT,
		IN p_ngaybatdau datetime,
    IN p_ngayketthuc datetime,
		IN p_idsanpham INT)
BEGIN
    INSERT INTO giamgia (phantram, ngaybatdau, ngayketthuc, idsanpham)
    VALUES (p_phantram, p_ngaybatdau, p_ngayketthuc, p_idsanpham);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_giamgia_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_giamgia_delete`;
delimiter ;;
CREATE PROCEDURE `sp_giamgia_delete`(IN p_id INT)
BEGIN
    DELETE FROM giamgia WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_giamgia_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_giamgia_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_giamgia_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM giamgia;
    
    SELECT *, total_count AS TotalCount
    FROM giamgia 
    ORDER BY ID DESC 
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_giamgia_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_giamgia_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_giamgia_getbyid`(IN p_id INT)
BEGIN
    SELECT g.*, s.ten AS TenSanPham, s.anh AS Anh
		FROM giamgia g
		INNER JOIN sanpham s ON g.idsanpham = s.id
		WHERE g.id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_giamgia_getbysanpham
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_giamgia_getbysanpham`;
delimiter ;;
CREATE PROCEDURE `sp_giamgia_getbysanpham`(IN p_id INT)
BEGIN
    SELECT g.*, s.ten AS TenSanPham
		FROM giamgia g
		INNER JOIN sanpham s ON g.idsanpham = s.id
		WHERE g.idsanpham = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_giamgia_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_giamgia_update`;
delimiter ;;
CREATE PROCEDURE `sp_giamgia_update`(IN p_id INT,
    IN p_phantram INT,
		IN p_ngaybatdau datetime,
    IN p_ngayketthuc datetime,
		IN p_idsanpham INT)
BEGIN
    UPDATE giamgia 
    SET 
        phantram = IFNULL(p_phantram, phantram),
				ngaybatdau = IFNULL(p_ngaybatdau, ngaybatdau),
				ngayketthuc = IFNULL(p_ngayketthuc, ngayketthuc),
        idsanpham = IFNULL(p_idsanpham, idsanpham)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_giasanpham_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_giasanpham_create`;
delimiter ;;
CREATE PROCEDURE `sp_giasanpham_create`(IN p_gia INT,
		IN p_ngaybatdau datetime,
    IN p_ngayketthuc datetime,
		IN p_idsanpham INT)
BEGIN
    INSERT INTO giasanpham (gia, ngaybatdau, ngayketthuc, idsanpham)
    VALUES (p_gia, p_ngaybatdau, p_ngayketthuc, p_idsanpham);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_giasanpham_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_giasanpham_delete`;
delimiter ;;
CREATE PROCEDURE `sp_giasanpham_delete`(IN p_id INT)
BEGIN
    DELETE FROM giasanpham WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_giasanpham_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_giasanpham_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_giasanpham_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM giasanpham;
    
    SELECT *, total_count AS TotalCount
    FROM giasanpham 
    ORDER BY ID DESC 
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_giasanpham_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_giasanpham_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_giasanpham_getbyid`(IN p_id INT)
BEGIN
    SELECT g.*, s.ten AS TenSanPham
		FROM giasanpham g
		INNER JOIN sanpham s ON g.idsanpham = s.id
		WHERE g.id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_giasanpham_getbysanpham
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_giasanpham_getbysanpham`;
delimiter ;;
CREATE PROCEDURE `sp_giasanpham_getbysanpham`(IN p_id INT)
BEGIN
    SELECT g.*, s.ten AS TenSanPham
		FROM giasanpham g
		INNER JOIN sanpham s ON g.idsanpham = s.id
		WHERE g.idsanpham = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_giasanpham_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_giasanpham_update`;
delimiter ;;
CREATE PROCEDURE `sp_giasanpham_update`(IN p_id INT,
    IN p_gia INT,
		IN p_ngaybatdau datetime,
    IN p_ngayketthuc datetime,
		IN p_idsanpham INT)
BEGIN
    UPDATE giasanpham 
    SET 
        gia = IFNULL(p_gia, gia),
				ngaybatdau = IFNULL(p_ngaybatdau, ngaybatdau),
				ngayketthuc = IFNULL(p_ngayketthuc, ngayketthuc),
        idsanpham = IFNULL(p_idsanpham, idsanpham)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_gioithieu_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_gioithieu_create`;
delimiter ;;
CREATE PROCEDURE `sp_gioithieu_create`(IN p_anh VARCHAR(255),
		IN p_noidung TEXT,
    IN p_trangthai INT)
BEGIN
    INSERT INTO gioithieu (anh, noidung, trangthai)
    VALUES (p_anh, p_noidung, p_trangthai);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_gioithieu_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_gioithieu_delete`;
delimiter ;;
CREATE PROCEDURE `sp_gioithieu_delete`(IN p_id INT)
BEGIN
    DELETE FROM gioithieu WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_gioithieu_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_gioithieu_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_gioithieu_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT,
    IN p_noidung TEXT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM gioithieu WHERE noidung LIKE CONCAT('%', p_noidung, '%');
    
    SELECT *, total_count AS TotalCount
    FROM gioithieu 
    WHERE noidung LIKE CONCAT('%', p_noidung, '%')
    ORDER BY ID DESC 
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_gioithieu_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_gioithieu_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_gioithieu_getbyid`(IN p_id INT)
BEGIN
    SELECT * FROM gioithieu WHERE ID = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_gioithieu_get_asc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_gioithieu_get_asc`;
delimiter ;;
CREATE PROCEDURE `sp_gioithieu_get_asc`()
BEGIN
    SELECT * 
		FROM gioithieu 
		WHERE trangthai = 1
		ORDER BY ID ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_gioithieu_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_gioithieu_update`;
delimiter ;;
CREATE PROCEDURE `sp_gioithieu_update`(IN p_id INT,
    IN p_anh VARCHAR(255),
		IN p_noidung TEXT,
    IN p_trangthai INT)
BEGIN
    UPDATE gioithieu 
    SET 
        anh = IFNULL(p_anh, anh),
				noidung = IFNULL(p_noidung, noidung),
        trangthai = IFNULL(p_trangthai, trangthai)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_hoadonnhap_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_hoadonnhap_create`;
delimiter ;;
CREATE PROCEDURE `sp_hoadonnhap_create`(IN p_idnhacungcap INT,
		IN p_idnguoidung INT)
BEGIN
    INSERT INTO hoadonnhap (ngaynhap, idnhacungcap, idnguoidung)
    VALUES (NOW(), p_idnhacungcap, p_idnguoidung);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_hoadonnhap_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_hoadonnhap_delete`;
delimiter ;;
CREATE PROCEDURE `sp_hoadonnhap_delete`(IN p_id INT)
BEGIN
    DELETE FROM hoadonnhap WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_hoadonnhap_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_hoadonnhap_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_hoadonnhap_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM hoadonnhap;
    
    SELECT h.*, n.ten AS TenNhaCungCap, nd.ten AS TenNguoiDung, CAST(SUM(c.gia * c.soluong) AS SIGNED) AS TongTien, total_count AS TotalCount
    FROM hoadonnhap h
    INNER JOIN nhacungcap n ON h.idnhacungcap = n.id
    INNER JOIN cthoadonnhap c ON c.idhoadonnhap = h.id
    INNER JOIN nguoidung nd ON h.idnguoidung = nd.id
		GROUP BY h.ID
    ORDER BY ID DESC
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_hoadonnhap_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_hoadonnhap_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_hoadonnhap_getbyid`(IN p_id INT)
BEGIN
    SELECT h.*, n.ten AS TenNhaCungCap, nd.ten AS TenNguoiDung, CAST(SUM(c.gia * c.soluong) AS SIGNED) AS TongTien
		FROM hoadonnhap h
		INNER JOIN nhacungcap n ON h.idnhacungcap = n.id
		INNER JOIN cthoadonnhap c ON c.IDHoaDonNhap = h.id
		INNER JOIN nguoidung nd ON h.idnguoidung = nd.id
		WHERE h.id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_hoadonnhap_getnew
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_hoadonnhap_getnew`;
delimiter ;;
CREATE PROCEDURE `sp_hoadonnhap_getnew`()
BEGIN
    SELECT s.id AS ID
		FROM hoadonnhap s
		ORDER BY id DESC
		LIMIT 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_hoadonnhap_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_hoadonnhap_update`;
delimiter ;;
CREATE PROCEDURE `sp_hoadonnhap_update`(IN p_id INT,
		IN p_idnhacungcap INT)
BEGIN
    UPDATE hoadonnhap 
    SET 
				idnhacungcap = IFNULL(p_idnhacungcap, idnhacungcap)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_kho_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_kho_create`;
delimiter ;;
CREATE PROCEDURE `sp_kho_create`(IN p_ten VARCHAR(255),
		IN p_diachi VARCHAR(255),
    IN p_trangthai INT)
BEGIN
    INSERT INTO kho (ten, diachi, trangthai)
    VALUES (p_ten, p_diachi, p_trangthai);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_kho_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_kho_delete`;
delimiter ;;
CREATE PROCEDURE `sp_kho_delete`(IN p_id INT)
BEGIN
    DELETE FROM kho WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_kho_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_kho_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_kho_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT,
    IN p_ten TEXT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM kho WHERE ten LIKE CONCAT('%', p_ten, '%');
    
    SELECT *, total_count AS TotalCount
    FROM kho 
    WHERE ten LIKE CONCAT('%', p_ten, '%')
    ORDER BY ID DESC 
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_kho_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_kho_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_kho_getbyid`(IN p_id INT)
BEGIN
    SELECT * FROM kho WHERE ID = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_kho_get_asc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_kho_get_asc`;
delimiter ;;
CREATE PROCEDURE `sp_kho_get_asc`()
BEGIN
    SELECT * 
		FROM kho 
		WHERE trangthai = 1
		ORDER BY ID ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_kho_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_kho_update`;
delimiter ;;
CREATE PROCEDURE `sp_kho_update`(IN p_id INT,
    IN p_ten VARCHAR(255),
		IN p_diachi VARCHAR(255),
    IN p_trangthai INT)
BEGIN
    UPDATE kho 
    SET 
        ten = IFNULL(p_ten, ten),
				diachi = IFNULL(p_diachi, diachi),
        trangthai = IFNULL(p_trangthai, trangthai)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_lienhe_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_lienhe_create`;
delimiter ;;
CREATE PROCEDURE `sp_lienhe_create`(IN p_noidung TEXT,
    IN p_trangthai INT)
BEGIN
    INSERT INTO lienhe (noidung, trangthai)
    VALUES (p_noidung, p_trangthai);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_lienhe_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_lienhe_delete`;
delimiter ;;
CREATE PROCEDURE `sp_lienhe_delete`(IN p_id INT)
BEGIN
    DELETE FROM lienhe WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_lienhe_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_lienhe_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_lienhe_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT,
    IN p_noidung TEXT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM lienhe WHERE noidung LIKE CONCAT('%', p_noidung, '%');
    
    SELECT *, total_count AS TotalCount
    FROM lienhe 
    WHERE noidung LIKE CONCAT('%', p_noidung, '%')
    ORDER BY ID DESC 
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_lienhe_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_lienhe_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_lienhe_getbyid`(IN p_id INT)
BEGIN
    SELECT * FROM lienhe WHERE ID = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_lienhe_get_asc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_lienhe_get_asc`;
delimiter ;;
CREATE PROCEDURE `sp_lienhe_get_asc`()
BEGIN
    SELECT * 
		FROM lienhe 
		WHERE trangthai = 1
		ORDER BY ID ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_lienhe_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_lienhe_update`;
delimiter ;;
CREATE PROCEDURE `sp_lienhe_update`(IN p_id INT,
    IN p_noidung TEXT,
    IN p_trangthai INT)
BEGIN
    UPDATE lienhe 
    SET 
        noidung = IFNULL(p_noidung, noidung),
        trangthai = IFNULL(p_trangthai, trangthai)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_loaisanpham_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_loaisanpham_create`;
delimiter ;;
CREATE PROCEDURE `sp_loaisanpham_create`(IN p_ten VARCHAR(255),
		IN p_bieutuong VARCHAR(255),
    IN p_trangthai INT)
BEGIN
    INSERT INTO loaisanpham (ten, bieutuong, trangthai)
    VALUES (p_ten, p_bieutuong, p_trangthai);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_loaisanpham_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_loaisanpham_delete`;
delimiter ;;
CREATE PROCEDURE `sp_loaisanpham_delete`(IN p_id INT)
BEGIN
    DELETE FROM loaisanpham WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_loaisanpham_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_loaisanpham_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_loaisanpham_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT,
    IN p_ten TEXT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM loaisanpham WHERE ten LIKE CONCAT('%', p_ten, '%');
    
    SELECT *, total_count AS TotalCount
    FROM loaisanpham 
    WHERE ten LIKE CONCAT('%', p_ten, '%')
    ORDER BY ID DESC 
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_loaisanpham_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_loaisanpham_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_loaisanpham_getbyid`(IN p_id INT)
BEGIN
    SELECT * FROM loaisanpham WHERE ID = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_loaisanpham_get_asc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_loaisanpham_get_asc`;
delimiter ;;
CREATE PROCEDURE `sp_loaisanpham_get_asc`()
BEGIN
    SELECT l.*, 
           (SELECT COUNT(DISTINCT s.id) FROM sanpham s WHERE s.idloai = l.id AND CURDATE() BETWEEN (SELECT NgayBatDau FROM giasanpham WHERE idsanpham = s.id) AND (SELECT NgayKetThuc FROM giasanpham WHERE idsanpham = s.id)) AS SoLuong
		FROM loaisanpham l
		WHERE l.trangthai = 1
		ORDER BY l.id ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_loaisanpham_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_loaisanpham_update`;
delimiter ;;
CREATE PROCEDURE `sp_loaisanpham_update`(IN p_id INT,
    IN p_ten VARCHAR(255),
		IN p_bieutuong VARCHAR(255),
    IN p_trangthai INT)
BEGIN
    UPDATE loaisanpham 
    SET 
        ten = IFNULL(p_ten, ten),
				bieutuong = IFNULL(p_bieutuong, bieutuong),
        trangthai = IFNULL(p_trangthai, trangthai)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_menu_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_menu_create`;
delimiter ;;
CREATE PROCEDURE `sp_menu_create`(IN p_ten VARCHAR(255),
		IN p_link VARCHAR(255),
		IN p_trangthai INT,
    IN p_idcha INT)
BEGIN
    INSERT INTO menu (ten, link, trangthai, idcha)
    VALUES (p_ten, p_link, p_trangthai, p_idcha);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_menu_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_menu_delete`;
delimiter ;;
CREATE PROCEDURE `sp_menu_delete`(IN p_id INT)
BEGIN
    DELETE FROM menu WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_menu_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_menu_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_menu_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT,
    IN p_ten TEXT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM menu WHERE ten LIKE CONCAT('%', p_ten, '%');
    
    SELECT mn.*, total_count AS TotalCount, m.ten AS TenMenuCha
    FROM menu mn
		LEFT JOIN menu m ON mn.idCha = m.id
    WHERE mn.ten LIKE CONCAT('%', p_ten, '%')
    ORDER BY mn.ID DESC 
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_menu_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_menu_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_menu_getbyid`(IN p_id INT)
BEGIN
    SELECT * FROM menu WHERE ID = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_menu_get_asc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_menu_get_asc`;
delimiter ;;
CREATE PROCEDURE `sp_menu_get_asc`()
BEGIN
    SELECT * 
    FROM menu 
    WHERE trangthai = 1
    ORDER BY ID ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_menu_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_menu_update`;
delimiter ;;
CREATE PROCEDURE `sp_menu_update`(IN p_id INT,
    IN p_ten VARCHAR(255),
		IN p_link VARCHAR(255),
		IN p_trangthai INT,
    IN p_idcha INT)
BEGIN
    UPDATE menu 
    SET 
        ten = IFNULL(p_ten, ten),
				link = IFNULL(p_link, link),
				trangthai = IFNULL(p_trangthai, trangthai),
        idcha = IFNULL(p_idcha, idcha)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nguoidung_confirm
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nguoidung_confirm`;
delimiter ;;
CREATE PROCEDURE `sp_nguoidung_confirm`(IN p_token VARCHAR(255))
BEGIN
    UPDATE nguoidung 
    SET 
				emailconfimed = true
    WHERE token = p_token;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nguoidung_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nguoidung_create`;
delimiter ;;
CREATE PROCEDURE `sp_nguoidung_create`(IN p_taikhoan VARCHAR(255),
		IN p_matkhau VARCHAR(255),
    IN p_email VARCHAR(255),
		IN p_ten VARCHAR(255),
		IN p_diachi VARCHAR(255),
		IN p_sdt VARCHAR(255),
		IN p_gioitinh INT,
		IN p_trangthai INT,
		IN p_idquyen INT,
		IN p_token VARCHAR(255))
BEGIN
    INSERT INTO nguoidung (taikhoan, matkhau, email, ten, ngaytao, diachi, sdt, gioitinh, anh, trangthai, idquyen, emailconfimed, token)
    VALUES (p_taikhoan, p_matkhau, p_email, p_ten, NOW(), p_diachi, p_sdt, 1, "avatar.png", p_trangthai, p_idquyen, 0, p_token);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nguoidung_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nguoidung_delete`;
delimiter ;;
CREATE PROCEDURE `sp_nguoidung_delete`(IN p_id INT)
BEGIN
    DELETE FROM nguoidung WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nguoidung_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nguoidung_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_nguoidung_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT,
    IN p_ten NVARCHAR(255),
    IN p_idquyen INT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM nguoidung WHERE ten LIKE CONCAT('%', p_ten, '%') AND IFNULL(p_idquyen, idquyen) = idquyen;
    
    SELECT n.*, q.ten AS TenQuyen, total_count AS TotalCount
    FROM nguoidung n
    LEFT JOIN quyen q ON n.idquyen = q.id
    WHERE (p_idQuyen IS NULL OR n.idquyen = p_idQuyen) AND (n.ten LIKE CONCAT('%', p_ten, '%'))
    ORDER BY n.ID DESC
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nguoidung_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nguoidung_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_nguoidung_getbyid`(IN p_id INT)
BEGIN
    SELECT n.*, q.ten AS TenQuyen
		FROM nguoidung n
		LEFT JOIN quyen q ON n.idquyen = q.id
		WHERE n.id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nguoidung_kiemtra
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nguoidung_kiemtra`;
delimiter ;;
CREATE PROCEDURE `sp_nguoidung_kiemtra`(IN p_taikhoan VARCHAR(255),
		IN p_email VARCHAR(255))
BEGIN
    SELECT n.taikhoan AS TaiKhoan, n.email AS Email, n.emailconfimed AS EmailConfimed
		FROM nguoidung n 
		WHERE (n.taikhoan = p_taikhoan OR n.email = p_email);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nguoidung_login
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nguoidung_login`;
delimiter ;;
CREATE PROCEDURE `sp_nguoidung_login`(IN p_taikhoan VARCHAR(255),
		IN p_matkhau VARCHAR(255))
BEGIN
    SELECT n.*, q.ten AS TenQuyen
		FROM nguoidung n 
		INNER JOIN quyen q ON n.idquyen = q.id
		WHERE (n.taikhoan = p_taikhoan OR n.email = p_taikhoan) AND n.matkhau = p_matkhau
		GROUP BY n.id, n.taikhoan, n.email;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nguoidung_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nguoidung_update`;
delimiter ;;
CREATE PROCEDURE `sp_nguoidung_update`(IN p_id INT,
		IN p_matkhau VARCHAR(255),
		IN p_ten VARCHAR(255),
		IN p_diachi VARCHAR(255),
		IN p_sdt VARCHAR(255),
		IN p_gioitinh INT,
		IN p_anh VARCHAR(255),
		IN p_trangthai INT,
		IN p_idquyen INT)
BEGIN
    UPDATE nguoidung 
    SET 
				matkhau = IFNULL(p_matkhau, matkhau),
				ten = IFNULL(p_ten, ten),
        diachi = IFNULL(p_diachi, diachi),
				sdt = IFNULL(p_sdt, sdt),
				gioitinh = IFNULL(p_gioitinh, gioitinh),
				anh = IFNULL(p_anh, anh),
				trangthai = IFNULL(p_trangthai, trangthai),
				idquyen = IFNULL(p_idquyen, idquyen)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nhacungcap_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nhacungcap_create`;
delimiter ;;
CREATE PROCEDURE `sp_nhacungcap_create`(IN p_ten VARCHAR(255),
		IN p_diachi VARCHAR(255),
		IN p_sdt VARCHAR(255),
    IN p_trangthai INT)
BEGIN
    INSERT INTO nhacungcap (ten, diachi, sdt, trangthai)
    VALUES (p_ten, p_diachi, p_sdt, p_trangthai);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nhacungcap_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nhacungcap_delete`;
delimiter ;;
CREATE PROCEDURE `sp_nhacungcap_delete`(IN p_id INT)
BEGIN
    DELETE FROM nhacungcap WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nhacungcap_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nhacungcap_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_nhacungcap_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT,
    IN p_ten TEXT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM nhacungcap WHERE ten LIKE CONCAT('%', p_ten, '%');
    
    SELECT *, total_count AS TotalCount
    FROM nhaCungCap 
    WHERE ten LIKE CONCAT('%', p_ten, '%')
    ORDER BY ID DESC 
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nhacungcap_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nhacungcap_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_nhacungcap_getbyid`(IN p_id INT)
BEGIN
    SELECT * FROM nhacungcap WHERE ID = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nhacungcap_get_asc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nhacungcap_get_asc`;
delimiter ;;
CREATE PROCEDURE `sp_nhacungcap_get_asc`()
BEGIN
    SELECT * 
		FROM nhacungcap 
		WHERE trangthai = 1
		ORDER BY ID ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nhacungcap_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nhacungcap_update`;
delimiter ;;
CREATE PROCEDURE `sp_nhacungcap_update`(IN p_id INT,
    IN p_ten VARCHAR(255),
		IN p_diachi VARCHAR(255),
		IN p_sdt VARCHAR(255),
    IN p_trangthai INT)
BEGIN
    UPDATE nhacungcap 
    SET 
        ten = IFNULL(p_ten, ten),
				diachi = IFNULL(p_diachi, diachi),
				sdt = IFNULL(p_sdt, sdt),
				trangthai = IFNULL(p_trangthai, trangthai)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nhasanxuat_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nhasanxuat_create`;
delimiter ;;
CREATE PROCEDURE `sp_nhasanxuat_create`(IN p_ten VARCHAR(255),
		IN p_anh VARCHAR(255),
		IN p_mota TEXT,
    IN p_trangthai INT)
BEGIN
    INSERT INTO nhasanxuat (ten, anh, mota, trangthai)
    VALUES (p_ten, p_anh, p_mota, p_trangthai);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nhasanxuat_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nhasanxuat_delete`;
delimiter ;;
CREATE PROCEDURE `sp_nhasanxuat_delete`(IN p_id INT)
BEGIN
    DELETE FROM nhasanxuat WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nhasanxuat_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nhasanxuat_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_nhasanxuat_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT,
    IN p_ten TEXT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM nhasanxuat WHERE ten LIKE CONCAT('%', p_ten, '%');
    
    SELECT *, total_count AS TotalCount
    FROM nhasanxuat 
    WHERE ten LIKE CONCAT('%', p_ten, '%')
    ORDER BY ID DESC 
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nhasanxuat_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nhasanxuat_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_nhasanxuat_getbyid`(IN p_id INT)
BEGIN
    SELECT * FROM nhasanxuat WHERE ID = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nhasanxuat_get_asc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nhasanxuat_get_asc`;
delimiter ;;
CREATE PROCEDURE `sp_nhasanxuat_get_asc`()
BEGIN
    SELECT n.*, COUNT(DISTINCT s.id) AS SoLuong
		FROM nhasanxuat n
		LEFT JOIN sanpham s ON n.id = s.idnhasanxuat
		LEFT JOIN giasanpham g ON s.id = g.idsanpham AND CURDATE() 
		BETWEEN g.NgayBatDau AND g.NgayKetThuc
		WHERE n.trangthai = 1
		GROUP BY n.id
		ORDER BY n.id ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_nhasanxuat_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_nhasanxuat_update`;
delimiter ;;
CREATE PROCEDURE `sp_nhasanxuat_update`(IN p_id INT,
    IN p_ten VARCHAR(255),
		IN p_anh VARCHAR(255),
		IN p_mota TEXT,
    IN p_trangthai INT)
BEGIN
    UPDATE nhasanxuat 
    SET 
        ten = IFNULL(p_ten, ten),
				anh = IFNULL(p_anh, anh),
				mota = IFNULL(p_mota, mota),
				trangthai = IFNULL(p_trangthai, trangthai)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_phuongthucthanhtoan_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_phuongthucthanhtoan_create`;
delimiter ;;
CREATE PROCEDURE `sp_phuongthucthanhtoan_create`(IN p_ten VARCHAR(255),
		IN p_mota VARCHAR(255),
    IN p_trangthai INT)
BEGIN
    INSERT INTO phuongthucthanhtoan (ten, mota, trangthai)
    VALUES (p_ten, p_mota, p_trangthai);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_phuongthucthanhtoan_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_phuongthucthanhtoan_delete`;
delimiter ;;
CREATE PROCEDURE `sp_phuongthucthanhtoan_delete`(IN p_id INT)
BEGIN
    DELETE FROM phuongthucthanhtoan WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_phuongthucthanhtoan_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_phuongthucthanhtoan_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_phuongthucthanhtoan_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT,
    IN p_ten TEXT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM phuongthucthanhtoan WHERE ten LIKE CONCAT('%', p_ten, '%');
    
    SELECT *, total_count AS TotalCount
    FROM phuongthucthanhtoan 
    WHERE ten LIKE CONCAT('%', p_ten, '%')
    ORDER BY ID DESC 
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_phuongthucthanhtoan_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_phuongthucthanhtoan_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_phuongthucthanhtoan_getbyid`(IN p_id INT)
BEGIN
    SELECT * FROM phuongthucthanhtoan WHERE ID = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_phuongthucthanhtoan_get_asc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_phuongthucthanhtoan_get_asc`;
delimiter ;;
CREATE PROCEDURE `sp_phuongthucthanhtoan_get_asc`()
BEGIN
    SELECT * 
		FROM phuongthucthanhtoan 
		WHERE trangthai = 1
		ORDER BY ID ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_phuongthucthanhtoan_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_phuongthucthanhtoan_update`;
delimiter ;;
CREATE PROCEDURE `sp_phuongthucthanhtoan_update`(IN p_id INT,
    IN p_ten VARCHAR(255),
		IN p_mota VARCHAR(255),
    IN p_trangthai INT)
BEGIN
    UPDATE phuongthucthanhtoan 
    SET 
        ten = IFNULL(p_ten, ten),
				mota = IFNULL(p_mota, mota),
				trangthai = IFNULL(p_trangthai, trangthai)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_quyen_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_quyen_create`;
delimiter ;;
CREATE PROCEDURE `sp_quyen_create`(IN p_ten VARCHAR(255),
		IN p_mota TEXT,
    IN p_trangthai INT)
BEGIN
    INSERT INTO quyen (ten, mota, trangthai)
    VALUES (p_ten, p_mota, p_trangthai);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_quyen_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_quyen_delete`;
delimiter ;;
CREATE PROCEDURE `sp_quyen_delete`(IN p_id INT)
BEGIN
    DELETE FROM quyen WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_quyen_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_quyen_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_quyen_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT,
    IN p_ten TEXT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM quyen WHERE ten LIKE CONCAT('%', p_ten, '%');
    
    SELECT *, total_count AS TotalCount
    FROM quyen 
    WHERE ten LIKE CONCAT('%', p_ten, '%')
    ORDER BY ID DESC 
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_quyen_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_quyen_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_quyen_getbyid`(IN p_id INT)
BEGIN
    SELECT * FROM quyen WHERE ID = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_quyen_get_asc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_quyen_get_asc`;
delimiter ;;
CREATE PROCEDURE `sp_quyen_get_asc`()
BEGIN
    SELECT * 
		FROM quyen 
		WHERE trangthai = 1
		ORDER BY ID ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_quyen_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_quyen_update`;
delimiter ;;
CREATE PROCEDURE `sp_quyen_update`(IN p_id INT,
    IN p_ten VARCHAR(255),
		IN p_mota TEXT,
    IN p_trangthai INT)
BEGIN
    UPDATE quyen 
    SET 
        ten = IFNULL(p_ten, ten),
				mota = IFNULL(p_mota, mota),
        trangthai = IFNULL(p_trangthai, trangthai)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_sanpham_banchay
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sanpham_banchay`;
delimiter ;;
CREATE PROCEDURE `sp_sanpham_banchay`(IN p_sl INT)
BEGIN
		SELECT s.id AS ID, s.ten AS Ten, s.anh AS Anh, s.trangthai AS TrangThai, g.gia AS Gia, k.phantram AS PhanTram, 
					 ct.soluong AS SoLuong, CAST((g.gia - (g.gia / 100 * k.phantram)) AS SIGNED) AS GiaGiamGia
    FROM sanpham s
		INNER JOIN giasanpham g ON s.id = g.idsanpham
		INNER JOIN ctdonhang c ON s.id = c.idsanpham 
		INNER JOIN donhang dh ON c.iddonhang = dh.id 
		LEFT JOIN giamgia k ON s.id = k.idsanpham
		LEFT JOIN ctkho ct ON s.id = ct.idsanpham
		WHERE (CURDATE() BETWEEN g.NgayBatDau AND g.NgayKetThuc) AND dh.trangthai = 1 AND dh.ngaydat >= CURDATE() - INTERVAL 30 DAY
		GROUP BY s.id, s.ten, s.anh, s.trangthai, g.gia, k.phantram, GiaGiamGia
		ORDER BY SUM(c.soluong) DESC, dh.ngaydat DESC
		LIMIT p_sl;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_sanpham_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sanpham_create`;
delimiter ;;
CREATE PROCEDURE `sp_sanpham_create`(IN p_ten VARCHAR(255),
		IN p_mota TEXT,
    IN p_anh VARCHAR(255),
		IN p_trangthai INT,
		IN p_idnhasanxuat INT,
		IN p_idloai INT)
BEGIN
    INSERT INTO sanpham (ten, mota, anh, ngaytao, trangthai, idnhasanxuat, idloai)
    VALUES (p_ten, p_mota, p_anh, NOW(), p_trangthai, p_idnhasanxuat, p_idloai);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_sanpham_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sanpham_delete`;
delimiter ;;
CREATE PROCEDURE `sp_sanpham_delete`(IN p_id INT)
BEGIN
    DELETE FROM sanpham WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_sanpham_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sanpham_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_sanpham_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT,
    IN p_ten TEXT)
BEGIN
		DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM sanpham WHERE p_ten IS NULL OR ten LIKE CONCAT('%', p_ten, '%');
		
    SELECT s.*, g.gia AS Gia, n.ten AS TenNhaSanXuat, l.ten AS TenLoai,
           IF(CURDATE() BETWEEN k.NgayBatDau AND k.NgayKetThuc, CAST((g.gia - (g.gia / 100 * k.phantram)) AS SIGNED), NULL) AS GiaGiamGia,
           IF(CURDATE() BETWEEN k.NgayBatDau AND k.NgayKetThuc, k.phantram, NULL) AS PhanTram,
           ct.soluong AS SoLuong, total_count AS TotalCount
    FROM sanpham s
    INNER JOIN giasanpham g ON s.id = g.idsanpham
    INNER JOIN nhasanxuat n ON s.idnhasanxuat = n.id
    INNER JOIN loaisanpham l ON s.idloai = l.id
    LEFT JOIN giamgia k ON s.id = k.idsanpham
    LEFT JOIN ctkho ct ON s.id = ct.idsanpham
    WHERE p_ten IS NULL OR s.ten LIKE CONCAT('%', p_ten, '%')
    GROUP BY s.id, s.ten, s.anh, s.mota, s.trangthai, g.gia, k.phantram, GiaGiamGia
    ORDER BY s.ngaytao DESC
		LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_sanpham_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sanpham_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_sanpham_getbyid`(IN p_id INT)
BEGIN
    SELECT s.*, l.ten AS TenLoai, n.ten AS TenNhaSanXuat, g.gia AS Gia, SUM(c.soluong) AS SoLuong,
           k.phantram AS PhanTram, CAST((g.gia - (g.gia / 100 * k.phantram)) AS SIGNED) AS GiaGiamGia
    FROM sanpham s
    LEFT JOIN giasanpham g ON s.id = g.idsanpham
    LEFT JOIN giamgia k ON s.id = k.idsanpham
    INNER JOIN loaisanpham l ON s.idloai = l.id
    INNER JOIN nhasanxuat n ON s.idnhasanxuat = n.id
    LEFT JOIN ctkho c ON s.id = c.idsanpham
    WHERE s.id = p_id
    GROUP BY s.id, s.ten, s.anh, g.gia, l.ten, n.ten, g.gia, k.phantram;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_sanpham_getnew
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sanpham_getnew`;
delimiter ;;
CREATE PROCEDURE `sp_sanpham_getnew`()
BEGIN
    SELECT s.id AS ID
		FROM sanpham s
		ORDER BY NgayTao DESC
		LIMIT 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_sanpham_giamgia
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sanpham_giamgia`;
delimiter ;;
CREATE PROCEDURE `sp_sanpham_giamgia`(IN p_sl INT)
BEGIN	
		SELECT s.id AS ID, s.ten AS Ten, s.anh AS Anh, s.trangthai AS TrangThai, g.gia AS Gia, k.phantram AS PhanTram,
					 ct.soluong AS SoLuong, CAST((g.gia - (g.gia / 100 * k.phantram)) AS SIGNED) AS GiaGiamGia
		FROM sanpham s
		INNER JOIN giasanpham g ON s.id = g.idsanpham
		INNER JOIN giamgia k ON s.id = k.idsanpham
		LEFT JOIN ctkho ct ON s.id = ct.idsanpham
		WHERE (CURDATE() Between k.NgayBatDau And k.NgayKetThuc) AND (CURDATE() BETWEEN g.NgayBatDau AND g.NgayKetThuc) AND s.trangthai = 1
		GROUP BY s.id, s.ten, s.anh, s.trangthai, g.gia, k.phantram, GiaGiamGia
		ORDER BY k.PhanTram DESC
		LIMIT p_sl;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_sanpham_moi
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sanpham_moi`;
delimiter ;;
CREATE PROCEDURE `sp_sanpham_moi`(IN p_sl INT)
BEGIN
    SELECT s.id AS ID, s.ten AS Ten, s.anh AS Anh, s.trangthai AS TrangThai, g.gia AS Gia, 
           IF(CURDATE() BETWEEN k.NgayBatDau AND k.NgayKetThuc, CAST((g.gia - (g.gia / 100 * k.phantram)) AS SIGNED), NULL) AS GiaGiamGia,
           IF(CURDATE() BETWEEN k.NgayBatDau AND k.NgayKetThuc, k.phantram, NULL) AS PhanTram,
           ct.soluong AS SoLuong
    FROM sanpham s
    INNER JOIN giasanpham g ON s.id = g.idsanpham
    LEFT JOIN giamgia k ON s.id = k.idsanpham
    LEFT JOIN ctkho ct ON s.id = ct.idsanpham
    WHERE (CURDATE() BETWEEN g.NgayBatDau AND g.NgayKetThuc) 
      AND s.trangthai = 1 
    GROUP BY s.id, s.ten, s.anh, s.trangthai, g.gia, GiaGiamGia, PhanTram
    ORDER BY s.NgayTao DESC
    LIMIT p_sl;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_sanpham_random
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sanpham_random`;
delimiter ;;
CREATE PROCEDURE `sp_sanpham_random`(IN p_sl INT)
BEGIN	
		SELECT s.id AS ID, s.ten AS Ten, s.anh AS Anh, s.trangthai AS TrangThai, g.gia AS Gia, k.phantram AS PhanTram,
					 ct.soluong AS SoLuong, CAST((g.gia - (g.gia / 100 * k.phantram)) AS SIGNED) AS GiaGiamGia
		FROM sanpham s
		INNER JOIN giasanpham g ON s.id = g.idsanpham
		LEFT JOIN giamgia k ON s.id = k.idsanpham
		LEFT JOIN ctkho ct ON s.id = ct.idsanpham 
		WHERE (CURDATE() BETWEEN g.NgayBatDau AND g.NgayKetThuc) AND s.trangthai = 1
		GROUP BY s.id, s.ten, s.anh, s.trangthai, g.gia, k.phantram, GiaGiamGia
		ORDER BY RAND()
		LIMIT p_sl;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_sanpham_search
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sanpham_search`;
delimiter ;;
CREATE PROCEDURE `sp_sanpham_search`(IN p_pageindex INT,
    IN p_pagesize INT,
    IN p_id INT,
    IN p_ten NVARCHAR(255),
    IN p_tennhasanxuat NVARCHAR(255),
    IN p_tenloai NVARCHAR(255),
    IN p_mingia INT,
    IN p_maxgia INT,
    IN p_idnhasanxuat INT,
    IN p_idloai INT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    -- Đếm tổng số lượng sản phẩm phù hợp với điều kiện
    SELECT COUNT(*) INTO total_count 
    FROM sanpham s
    INNER JOIN giasanpham g ON s.id = g.idsanpham
    INNER JOIN nhasanxuat n ON s.idnhasanxuat = n.id
    INNER JOIN loaisanpham l ON s.idloai = l.id
    LEFT JOIN giamgia k ON s.id = k.idsanpham
    WHERE (CURDATE() BETWEEN g.NgayBatDau AND g.NgayKetThuc)
        AND (p_id IS NULL OR s.id = p_id)
        AND (p_ten IS NULL OR s.ten LIKE CONCAT('%', p_ten, '%'))
        AND (p_tennhasanxuat IS NULL OR n.ten LIKE CONCAT('%', p_tennhasanxuat, '%'))
        AND (p_tenloai IS NULL OR l.ten LIKE CONCAT('%', p_tenloai, '%'))
        AND (
            (p_mingia IS NULL AND p_maxgia IS NULL)
            OR (
                p_mingia IS NOT NULL 
                AND p_maxgia IS NULL 
                AND IF(k.phantram IS NULL, g.gia, CAST((g.gia - (g.gia / 100 * k.phantram)) AS SIGNED)) >= p_mingia
            )
            OR (
                p_mingia IS NULL 
                AND p_maxgia IS NOT NULL 
                AND IF(k.phantram IS NULL, g.gia, CAST((g.gia - (g.gia / 100 * k.phantram)) AS SIGNED)) <= p_maxgia
            )
            OR (
                p_mingia IS NOT NULL 
                AND p_maxgia IS NOT NULL 
                AND IF(k.phantram IS NULL, g.gia, CAST((g.gia - (g.gia / 100 * k.phantram)) AS SIGNED)) BETWEEN p_mingia AND p_maxgia
            )
        )
        AND (p_idnhasanxuat IS NULL OR s.idnhasanxuat = p_idnhasanxuat)
        AND (p_idloai IS NULL OR s.idloai = p_idloai)
        AND s.trangthai = 1;

    -- Lấy dữ liệu của trang hiện tại
    SELECT s.id AS ID, s.ten AS Ten, s.anh AS Anh, s.mota AS MoTa, s.trangthai AS TrangThai, g.gia AS Gia, k.phantram AS PhanTram,
        ct.soluong AS SoLuong, CAST((g.gia - (g.gia / 100 * k.phantram)) AS SIGNED) AS GiaGiamGia, total_count AS TotalCount
    FROM sanpham s
    INNER JOIN giasanpham g ON s.id = g.idsanpham
    INNER JOIN nhasanxuat n ON s.idnhasanxuat = n.id
    INNER JOIN loaisanpham l ON s.idloai = l.id
    LEFT JOIN giamgia k ON s.id = k.idsanpham
    LEFT JOIN ctkho ct ON s.id = ct.idsanpham
    WHERE (CURDATE() BETWEEN g.NgayBatDau AND g.NgayKetThuc)
        AND (p_id IS NULL OR s.id = p_id)
        AND (p_ten IS NULL OR s.ten LIKE CONCAT('%', p_ten, '%'))
        AND (p_tennhasanxuat IS NULL OR n.ten LIKE CONCAT('%', p_tennhasanxuat, '%'))
        AND (p_tenloai IS NULL OR l.ten LIKE CONCAT('%', p_tenloai, '%'))
        AND (
            (p_mingia IS NULL AND p_maxgia IS NULL)
            OR (
                p_mingia IS NOT NULL 
                AND p_maxgia IS NULL 
                AND IF(k.phantram IS NULL, g.gia, CAST((g.gia - (g.gia / 100 * k.phantram)) AS SIGNED)) >= p_mingia
            )
            OR (
                p_mingia IS NULL 
                AND p_maxgia IS NOT NULL 
                AND IF(k.phantram IS NULL, g.gia, CAST((g.gia - (g.gia / 100 * k.phantram)) AS SIGNED)) <= p_maxgia
            )
            OR (
                p_mingia IS NOT NULL 
                AND p_maxgia IS NOT NULL 
                AND IF(k.phantram IS NULL, g.gia, CAST((g.gia - (g.gia / 100 * k.phantram)) AS SIGNED)) BETWEEN p_mingia AND p_maxgia
            )
        )
        AND (p_idnhasanxuat IS NULL OR s.idnhasanxuat = p_idnhasanxuat)
        AND (p_idloai IS NULL OR s.idloai = p_idloai)
        AND s.trangthai = 1
    GROUP BY s.id, s.ten, s.anh, s.mota, s.trangthai, g.gia, k.phantram, GiaGiamGia
    ORDER BY s.ngaytao DESC
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_sanpham_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sanpham_update`;
delimiter ;;
CREATE PROCEDURE `sp_sanpham_update`(IN p_id INT,
    IN p_ten VARCHAR(255),
		IN p_mota TEXT,
    IN p_anh VARCHAR(255),
		IN p_trangthai INT,
		IN p_idnhasanxuat INT,
		IN p_idloai INT)
BEGIN
    UPDATE sanpham 
    SET 
        ten = IFNULL(p_ten, ten),
				mota = IFNULL(p_mota, mota),
				anh = IFNULL(p_anh, anh),
				trangthai = IFNULL(p_trangthai, trangthai),
				idnhasanxuat = IFNULL(p_idnhasanxuat, idnhasanxuat),
        idloai = IFNULL(p_idloai, idloai)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_slide_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_slide_create`;
delimiter ;;
CREATE PROCEDURE `sp_slide_create`(IN p_anh VARCHAR(255),
    IN p_trangthai INT)
BEGIN
    INSERT INTO slide (anh, trangthai)
    VALUES (p_anh, p_trangthai);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_slide_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_slide_delete`;
delimiter ;;
CREATE PROCEDURE `sp_slide_delete`(IN p_id INT)
BEGIN
    DELETE FROM slide WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_slide_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_slide_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_slide_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM slide;
    
    SELECT *, total_count AS TotalCount
    FROM slide 
    ORDER BY ID DESC 
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_slide_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_slide_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_slide_getbyid`(IN p_id INT)
BEGIN
    SELECT * FROM slide WHERE ID = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_slide_get_asc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_slide_get_asc`;
delimiter ;;
CREATE PROCEDURE `sp_slide_get_asc`()
BEGIN
    SELECT * 
		FROM slide 
		WHERE trangthai = 1
		ORDER BY ID ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_slide_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_slide_update`;
delimiter ;;
CREATE PROCEDURE `sp_slide_update`(IN p_id INT,
    IN p_anh VARCHAR(255),
    IN p_trangthai INT)
BEGIN
    UPDATE slide 
    SET 
        anh = IFNULL(p_anh, anh),
        trangthai = IFNULL(p_trangthai, trangthai)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_thongke_doanhthusanpham
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_thongke_doanhthusanpham`;
delimiter ;;
CREATE PROCEDURE `sp_thongke_doanhthusanpham`(IN p_sl INT)
BEGIN
		SELECT s.id AS ID, s.ten AS Ten, s.anh AS Anh, Sum(c.soluong * c.gia) AS DoanhThu
		FROM sanpham s 
		INNER JOIN ctdonhang c ON s.id = c.idsanpham
		INNER JOIN donhang d ON c.iddonhang = d.id
		WHERE d.TrangThai = 1
		GROUP BY s.id, s.ten, s.anh
		LIMIT p_sl;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_thongke_doanhthutheothang
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_thongke_doanhthutheothang`;
delimiter ;;
CREATE PROCEDURE `sp_thongke_doanhthutheothang`(IN p_sl INT)
BEGIN
    SELECT CONCAT(MONTH(d.ngaydat), '/', YEAR(d.ngaydat)) AS ThoiGian, 
					 SUM(c.soluong * c.gia) AS DoanhThuTheoThang
    FROM donhang d 
    INNER JOIN ctdonhang c ON d.id = c.iddonhang
    WHERE d.trangthai = 1
    GROUP BY ThoiGian
    ORDER BY YEAR(d.ngaydat) ASC, MONTH(d.ngaydat) ASC
		LIMIT p_sl;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_thongke_loaisanphambanchay
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_thongke_loaisanphambanchay`;
delimiter ;;
CREATE PROCEDURE `sp_thongke_loaisanphambanchay`(IN p_sl INT)
BEGIN
		SELECT l.ten AS TenLoai, SUM(c.soluong) AS SoLuong, SUM(c.soluong * c.gia) AS DoanhThu
		FROM sanpham s
		INNER JOIN ctdonhang c ON s.id = c.idsanpham
		INNER JOIN donhang d ON c.iddonhang = d.id
		INNER JOIN loaisanpham l ON l.id = s.idloai
		WHERE d.trangthai = 1
		GROUP BY l.ten
		LIMIT p_sl;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_thongke_soluong
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_thongke_soluong`;
delimiter ;;
CREATE PROCEDURE `sp_thongke_soluong`()
BEGIN
    DECLARE soLuongSanPham INT;
    DECLARE soLuongNguoiDung INT;
		DECLARE soLuongDonHang INT;
		DECLARE doanhSo INT;

    SELECT COUNT(id) INTO soLuongSanPham FROM sanpham;
    SELECT COUNT(id) INTO soLuongNguoiDung FROM nguoidung;
		SELECT COUNT(id) INTO soLuongDonHang FROM donhang;
		
		SELECT SUM(c.soluong * c.gia) INTO doanhSo
    FROM donhang d 
    INNER JOIN ctdonhang c ON d.id = c.iddonhang
    WHERE d.trangthai = 1 AND YEAR(d.ngaydat) = YEAR(CURRENT_DATE) - 1;

    SELECT soLuongSanPham AS 'SoLuongSanPham', soLuongNguoiDung AS 'SoLuongNguoiDung', soLuongDonHang AS 'SoLuongDonHang', doanhSo AS 'DoanhSo';
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_thongso_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_thongso_create`;
delimiter ;;
CREATE PROCEDURE `sp_thongso_create`(IN p_ten VARCHAR(255),
		IN p_mota TEXT,
		IN p_idsanpham INT)
BEGIN
    INSERT INTO thongso (ten, mota, idsanpham)
    VALUES (p_ten, p_mota, p_idsanpham);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_thongso_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_thongso_delete`;
delimiter ;;
CREATE PROCEDURE `sp_thongso_delete`(IN p_id INT)
BEGIN
    DELETE FROM thongso WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_thongso_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_thongso_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_thongso_getbyid`(IN p_id INT)
BEGIN
    SELECT * FROM thongso WHERE ID = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_thongso_getbysanpham
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_thongso_getbysanpham`;
delimiter ;;
CREATE PROCEDURE `sp_thongso_getbysanpham`(IN p_id INT)
BEGIN
    SELECT * FROM thongso WHERE idsanpham = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_thongso_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_thongso_update`;
delimiter ;;
CREATE PROCEDURE `sp_thongso_update`(IN p_id INT,
    IN p_ten VARCHAR(255),
		IN p_mota TEXT,
		IN p_idsanpham INT)
BEGIN
    UPDATE thongso 
    SET 
        ten = IFNULL(p_ten, ten),
				mota = IFNULL(p_mota, mota),
				idsanpham = IFNULL(p_idsanpham, idsanpham)
    WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_tintuc_create
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_tintuc_create`;
delimiter ;;
CREATE PROCEDURE `sp_tintuc_create`(IN p_tieude VARCHAR(255),
    IN p_noidung TEXT,
    IN p_anh VARCHAR(255),
    IN p_trangthai INT,
    IN p_idnguoidung INT)
BEGIN
    INSERT INTO tintuc (tieude, noidung, ngaydang, anh, trangthai, idnguoidung)
    VALUES (p_tieude, p_noidung, NOW(), p_anh, p_trangthai, p_idnguoidung);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_tintuc_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_tintuc_delete`;
delimiter ;;
CREATE PROCEDURE `sp_tintuc_delete`(IN p_id INT)
BEGIN
    DELETE FROM tintuc WHERE id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_tintuc_getall_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_tintuc_getall_desc`;
delimiter ;;
CREATE PROCEDURE `sp_tintuc_getall_desc`(IN p_pageindex INT,
    IN p_pagesize INT,
    IN p_tieude TEXT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM tintuc WHERE tieude LIKE CONCAT('%', p_tieude, '%');
    
    SELECT t.*, total_count AS TotalCount, n.ten AS Ten
    FROM tintuc t
		INNER JOIN nguoidung n ON t.idnguoidung = n.id
    WHERE t.tieude LIKE CONCAT('%', p_tieude, '%')
    ORDER BY t.NgayDang DESC 
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_tintuc_getbyid
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_tintuc_getbyid`;
delimiter ;;
CREATE PROCEDURE `sp_tintuc_getbyid`(IN p_id INT)
BEGIN
    SELECT t.*, n.ten AS Ten
		FROM tintuc t 
		INNER JOIN nguoidung n ON t.idnguoidung = n.id
		WHERE t.id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_tintuc_get_desc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_tintuc_get_desc`;
delimiter ;;
CREATE PROCEDURE `sp_tintuc_get_desc`(IN p_pageindex INT,
    IN p_pagesize INT)
BEGIN
    DECLARE start_index INT;
    DECLARE total_count INT;
    
    SET start_index = (p_pageindex - 1) * p_pagesize;
    
    SELECT COUNT(*) INTO total_count FROM tintuc;
    
    SELECT t.*, total_count AS TotalCount, n.ten AS Ten
    FROM tintuc t
		INNER JOIN nguoidung n ON t.idnguoidung = n.id
    WHERE t.trangthai = 1
    ORDER BY t.NgayDang DESC 
    LIMIT start_index, p_pagesize;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_tintuc_random
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_tintuc_random`;
delimiter ;;
CREATE PROCEDURE `sp_tintuc_random`(IN p_sl INT)
BEGIN	
		SELECT t.*, n.ten AS Ten
		FROM tintuc t 
		INNER JOIN nguoidung n ON t.idnguoidung = n.id
		WHERE t.trangthai = 1
		ORDER BY RAND()
		LIMIT p_sl;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_tintuc_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_tintuc_update`;
delimiter ;;
CREATE PROCEDURE `sp_tintuc_update`(IN p_id INT,
    IN p_tieude VARCHAR(255),
    IN p_noidung TEXT,
    IN p_anh VARCHAR(255),
    IN p_trangthai INT)
BEGIN
    UPDATE tintuc 
    SET 
        tieude = IFNULL(p_tieude, tieude),
        noidung = IFNULL(p_noidung, noidung),
        anh = IFNULL(p_anh, anh),
        trangthai = IFNULL(p_trangthai, trangthai)
    WHERE id = p_id;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
