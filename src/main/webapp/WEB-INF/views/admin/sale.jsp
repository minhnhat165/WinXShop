<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<%@include file="./common/head.jsp"%>
</head>

<body>
	<!--  flag -->
	<div class=" flag-modal-create" isOpen=${isOpenModalCreate }></div>
	<div class="modal-flag" idModal="${idModal}"></div>
	<div class="page-flag" data="sale"></div>
	<!-- end flag  -->

	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">

		<!-- sidebar  -->
		<%@include file="./common/sidebar.jsp"%>

		<!-- End sidebar  -->


		<div class="page-wrapper pt-0">
			<div class="alert-flag" aType='${typeMessage}' aMessage="${message }"></div>

			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-12">
						<div class="card shadow">
							<div class="card-body">
								<h5 class="card-title fs-3">Danh sách khuyến mãi</h5>
								<div class="">
									<table id="zero_config"
										class="table table-striped table-bordered no-wrap green-color">
										<thead>
											<tr>
												<th>Mã</th>
												<th>Tên khuyến mãi</th>
												<th>Ngày bắt đầu</th>
												<th>Ngày kết thúc</th>
												<th>Giá trị khuyến mãi</th>
												<th>Trang thái</th>
												<th>Thao tác</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="km" items="${DSKM }">

												<tr>
													<td>${km.maKM }</td>
													<td>${km.tenKM }</td>
													<td>${km.ngayBD }</td>
													<td>${km.ngayKT }</td>
													<td>${km.giaTriKM }</td>
													<td><span
														class="badge rounded-pill ${km.trangThai?'bg-primary': 'bg-secondary text-white'} "
														style="color: white !important">${km.trangThai?'Còn hiệu lực': 'Hết hiệu lực' }</span></td>
													<td><a href="admin/sale/detail/${km.maKM}.htm">
															<button class="btn btn-outline-info btn-sm">
																<i class="fas fa-info-circle"></i>
															</button>
													</a> <a href="admin/sale/update/${km.maKM}.htm">
															<button class="btn btn-outline-warning btn-sm">
																<i class="fas fa-edit"></i>
															</button>
													</a></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- End PAge Content -->
				<!-- ============================================================== -->
			</div>

			<div class="modal fade" id="modalCreate" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header green-bg-color">
							<h4 class="modal-title text-white" id="myCenterModalLabel">
								${formTitle}</h4>
							<button type="button" class="close v-close text-white"
								data-dismiss="modal" aria-hidden="true">×</button>
						</div>
						<div class="modal-body">
							<div
								class="container tm-mt-big tm-mb-big h-100 align-items-center justify-content-center">
								<div class="row">
									<div class="col-12">
										<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
											<div class="row tm-edit-product-row">
												<div class="col-12">
													<form:form action="${formAction }" method="post"
														modelAttribute="KM" class="tm-edit-product-form">

														<div class="row">
															<div class="col-xl-6 col-lg-6 col-md-12">
																<div class="form-group mb-3">
																	<label for="input-maKM">Mã khuyễn mãi </label>
																	<form:input path="maKM" id="input-maKM"
																		disabled="${btnAction=='btnUpdate'?'true': 'false' }"
																		name="maKM" type="text" class="form-control validate" />
																	<span class="text-danger"><form:errors
																			path="maKM"></form:errors></span>
																</div>
																<div class="form-group mb-3">
																	<label for="input-tenKM">Tên khuyến mãi </label>
																	<form:input type="text" path="tenKM" id="input-tenKM"
																		class="form-control validate" />
																	<span class="text-danger"><form:errors
																			path="tenKM"></form:errors></span>
																</div>
																<div class="form-group mb-3">
																	<label for="input-giaTriKM">Giá trị khuyến mãi
																	</label>
																	<form:input type="number" path="giaTriKM" min="0"
																		max="100" id="input-giaTriKM"
																		class="form-control validate" />
																	<span class="text-danger"><form:errors
																			path="giaTriKM"></form:errors></span>
																</div>
																<div class="form-group mb-3 pl-2">
																	<label for="">Trang thái </label>
																	<div class="row">
																		<div class="form-check col-6 px-5">
																			<form:radiobutton value="0" path="trangThai"
																				class="form-check-input validate" />
																			<label class="form-check-label" for="0"> Hết
																				hiệu lực</label>
																		</div>
																		<div class="form-check col-6">
																			<form:radiobutton value="1" path="trangThai"
																				class="form-check-input validate" />
																			<label class="form-check-label" for="1"> Còn
																				hiệu lực </label>
																		</div>
																	</div>

																</div>
															</div>
															<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
																<div class="row">
																	<div class="form-group col-xs-12 col-sm-6 pr-2">

																		<label for="input-ngayBD">Ngày bắt đầu </label>
																		<form:input type="date" path="ngayBD"
																			id="input-ngayBD" name="input-ngayBD"
																			class="form-control validate" />
																	</div>
																	<div class="form-group col-xs-12 col-sm-6 pl-2">
																		<label for="input-ngayKT">Ngày kết thúc </label>
																		<form:input type="date" path="ngayKT"
																			id="input-ngayKT" name="input-ngayKT"
																			class="form-control validate" />
																	</div>

																</div>
																<span class="text-danger"><form:errors
																		path="ngayBD"></form:errors></span>


																<div class="form-group my-3">
																	<label for="description">Mô tả</label>
																	<form:textarea class="form-control validate" rows="3"
																		path="moTa" style="min-height: 195px" />
																</div>
															</div>
														</div>
														<div class="col-12 px-0 mb-3">
															<button type="button"
																class="btn btn-outline-green shadow-none"
																data-toggle="collapse" href="#filterproduct"
																role="button" aria-expanded="false"
																aria-controls="collapseExample">
																<i class="fa-regular fa-circle-plus"></i> Sản phẩm áp
																dụng
															</button>
															<div class="collapse mt-3" id="filterproduct">
																<div class="card card-body p-2 py-3">
																	<div class="row">
																		<div class="row pl-4">
																			<div class="row tm-edit-product-form">
																				<div class="form-group mb-3 shadow-none col-md-5">
																					<label for="brand">Nhãn hàng </label> <select
																						class="form-select" multiple="multiple"
																						id="languages-disabled-id"></select>
																				</div>
																				<div class="form-group mb-3 col-md-5">
																					<label for="name">Loại </label> <select
																						class="custom-select rounded tm-select-accounts"
																						id="category">
																						<option selected>Tất cả</option>
																						<option value="1">Nam</option>
																						<option value="2">Nữ</option>
																					</select>
																				</div>

																				<div class="col-md-2 form-group text-white">
																					<label for="name">N </label>
																					<button name="btnFilterProduct"
																						class="btn btn-primary btn-block btn-green shadow-none"
																						data-toggle="modal" data-target="#product-modal">
																						Lọc</button>
																				</div>
																			</div>
																		</div>
																		<div class="row px-3">
																			<div class="col-12 px-4">Sản phẩm đã chọn</div>
																			<div class="col-12 px-4 product-sale-list mt-2"></div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-12 px-0">
															<button type="submit" name="${btnAction }"
																class="btn btn-primary btn-block text-uppercase btn-green shadow-none">
																${btnAction =='btnInsert'? 'Thêm': 'Cập nhật' }</button>
														</div>
													</form:form>
												</div>
											</div>
										</div>
									</div>
									<!-- /.modal -->
								</div>
								<!-- ============================================================== -->
								<!-- End Page wrapper  -->
								<!-- ============================================================== -->
							</div>
						</div>
					</div>
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<!-- Center modal content -->
			<div class="modal fade" tabindex="-1" role="dialog"
				aria-hidden="true" id="product-modal">
				<div class="modal-dialog modal-lg modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header green-bg-color">
							<h4 class="modal-title text-white">Danh sách sản phẩm</h4>
							<button type="button" class="close v-close text-white"
								data-dismiss="modal" aria-hidden="true">×</button>
						</div>
						<div class="modal-body p-4"
							style="height: 80vh; overflow-y: scroll">
							<div
								class="row bg-light p-2 rounded border border-green align-items-center product mb-2"
								product-id="SP001" data-name="Nước hoa nam blueee 100ml"
								onclick="handleClickProduct(this)">
								<div class="col-2">TTDK0001</div>
								<div class="col-1">
									<img
										src="https://lzd-img-global.slatic.net/g/p/40ff970a47db984b7316ee248fd41dfa.jpg_720x720q80.jpg_.webp"
										alt="" style="width: 50px; height: 50px" />
								</div>
								<div class="col-6">Nước hoa nam blueee 100ml</div>
								<div class="col-3" style="cursor: pointer">
									Giá: <span class="green-color" data-bs-toggle="collapse"
										href="#TTDK0001"> 2000000 đ </span>
								</div>
							</div>

							<div class="row"
								style="position: -webkit-sticky; position: sticky; bottom: 0px;">
								<div class="text-end px-0">
									<button class="btn btn-green"
										onclick="handleConfirmSelectProduct(this)">Xác Nhận</button>
									<button class="btn btn-secondary mb-0">Huỷ</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<!-- Center modal content -->
			<div class="modal fade" id="modalDetail" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header green-bg-color">
							<h4 class="modal-title text-white" id="myCenterModalLabel">
								Chi tiết thông tin khuyến mãi</h4>
							<button type="button" class="close v-close text-white"
								data-dismiss="modal" aria-hidden="true">×</button>
						</div>
						<div class="modal-body">
							<div class="container">
								<div class="row">
									<div class="col-12 text-center mb-3">
										<p class="m-b-10 f-w-600">Mã khuyến mãi</p>
										<div
											style="padding: 4px 8px; background-color: #088178; text-align: center; color: #fff; margin-left: 25%;"
											class="col-6">
											<h4 class="mt-2">${KMDetail.maKM }</h4>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-6 border-right">
										<div class="col-12 mb-3 mt-3">
											<p class="m-b-10 f-w-600">Tên khuyến mãi</p>
											<h6 class="text-muted f-w-400">${KMDetail.tenKM }</h6>
										</div>
										<div class="col-12 mb-3">
											<p class="m-b-10 f-w-600">Giá trị khuyến mãi</p>
											<h6 class="text-muted f-w-400">${KMDetail.giaTriKM }</h6>
										</div>
										<div class="col-12 mb-3">
											<p class="m-b-10 f-w-600">Ngày bắt đầu</p>
											<h6 class="text-muted f-w-400">${KMDetail.ngayBD }</h6>
										</div>
										<div class="col-12 mb-3">
											<p class="m-b-10 f-w-600">Ngày kết thúc</p>
											<h6 class="text-muted f-w-400">${KMDetail.ngayKT }</h6>
										</div>
										<div class="col-12 mb-3">
											<p class="m-b-10 f-w-600">Mô tả</p>
											<h6 class="text-muted f-w-400">${KMDetail.moTa }</h6>
										</div>
										<div class="col-12 mb-3">
											<p class="m-b-10 f-w-600">Trạng thái</p>
											<h6 class="text-muted f-w-400">${KMDetail.trangThai?'Còn hiệu lực': 'Hết hiệu lực' }</h6>
										</div>
									</div>
									<div class="col-6">
										<div class="col-12 mb-3 mt-3">
											<p class="m-b-10 f-w-600">Danh sách sản phẩm áp dụng</p>
											<h6 class="text-muted f-w-400">Nước hoa</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<%@include file="./common/script.jsp"%>

	<script>
	var options = [
        {
          text: "Arabic",
          selected: true,
          disabled: false,
          hidden: false,
        },
        {
          text: "Belarusian",
          selected: true,
          disabled: true,
          hidden: true,
        },
        {
          text: "Chinese",
          selected: true,
          disabled: false,
          hidden: false,
        },
        {
          text: "Dutch",
          selected: true,
          disabled: false,
          hidden: false,
        },
        {
          text: "English",
          selected: false,
          disabled: false,
          hidden: false,
        },
        {
          text: "French",
          selected: false,
          disabled: false,
          hidden: false,
        },
        {
          text: "Greek",
          selected: false,
          disabled: false,
          hidden: false,
        },
        {
          text: "Hindi",
          selected: false,
          disabled: false,
          hidden: false,
        },
        {
          text: "Italian",
          selected: false,
          disabled: false,
          hidden: false,
        },
      ];

      var $management = $("#languages-hidden-id, #languages-disabled-id");

      function resetManagement() {
        function createData(property) {
          var dataHTML = "";
          for (var i = 0; i < options.length; i++) {
            var o = options[i];
            dataHTML +=
              "<option " +
              (o[property] ? "selected" : "") +
              ' value="' +
              o.text +
              '"  data-index="' +
              i +
              '">' +
              o.text +
              "</option>";
          }
          return dataHTML;
        }
        $("#languages-hidden-id").html(createData("hidden"));
        $("#languages-disabled-id").html(createData("disabled"));
      }
      resetManagement();
      var languages1 = null;
      var languages2 = null;
      let isLanguages2 = true;
      var $languages = $("#languages1-id");
      if (isLanguages2) $languages = $languages.add("#languages2-id");
      var callMs = function (id, process) {
        return $(id).each(function (i, e) {
          let ms = $(e).data("DashboardCode.BsMultiSelect");
          if (ms) process(ms);
        });
      };
      //var callMs = function(id, process){ let ms = getMs(id); if (ms) process(ms); }
      $management.bsMultiSelect(function (e, c) {
        c.setSelected = function (eo, v) {
          eo.selected = v;
          var index = $(eo).data("index");

          if (e.id == "languages-hidden-id") {
            options[index].hidden = v;
            callMs($languages, function (ms) {
              ms.updateOptionHidden(index);
            });
          } else if (e.id == "languages-disabled-id") {
            options[index].disabled = v;
            callMs($languages, function (ms) {
              ms.updateOptionDisabled(index);
            });
          }
        };
      });

      var getIsAttached = function () {
        return $languages.data("DashboardCode.BsMultiSelect") != null;
      };
      var disabled = false;
      var disabledOptions = false;
      var install = function () {
        $languages.bsMultiSelect({
          options: options,
          getDisabled: function () {
            return disabled;
          },
          getIsOptionDisabled: function (o) {
            return o.disabled;
          },
          getIsOptionHidden: function (o) {
            return o.hidden;
          },
        });
        if (isLanguages2) {
          $("#languages1-id").on(
            "dashboardcode.multiselect:change",
            function () {
              $("#languages2-id").bsMultiSelect("UpdateOptionsSelected");
            },
          );
          $("#languages2-id").on(
            "dashboardcode.multiselect:change",
            function () {
              $("#languages1-id").bsMultiSelect("UpdateOptionsSelected");
            },
          );
        }
      };
      install();
      $("#btnAttach").click(function () {
        if (getIsAttached()) {
          $languages.bsMultiSelect("Dispose");
          $languages.unbind();
        } else {
          install();
        }
      });

      $("#btnDisable").click(function () {
        if (getIsAttached()) {
          disabled = !disabled;
          $languages.bsMultiSelect("UpdateDisabled");
        }
      });

      $("#btnDisableOptions").click(function () {
        if (getIsAttached()) {
          disabledOptions = !disabledOptions;
          $languages.bsMultiSelect("UpdateOptionsDisabled");
        }
      });

      $("#btnRemove").click(function () {
        var inputValue = $("#inputValue").val();
        if (inputValue) {
          var position = -1;
          for (var i = 0; i < options.length; i++) {
            var item = options[i];
            if (item.text.toLowerCase() == inputValue.toLowerCase()) {
              position = i;
              break;
            }
          }

          if (position >= 0) {
            options.splice(position, 1);
            resetManagement();
            $management.bsMultiSelect("UpdateData");
            if (getIsAttached()) {
              callMs("#languages1-id", function (ms) {
                ms.updateOptionRemoved(position);
              });
              callMs("#languages2-id", function (ms) {
                ms.updateOptionRemoved(position);
              });
            }
          }
        }
      });
      $("#btnAddSelected").click(function () {
        var inputValue = $("#inputValue").val();
        if (inputValue) {
          var position = -1;
          for (var i = 0; i < options.length; i++) {
            var item = options[i];
            if (item.text.toLowerCase() == inputValue.toLowerCase()) return;
            else if (item.text.toLowerCase() > inputValue.toLowerCase()) break;
          }
          position = i;
          if (position >= 0) {
            options.splice(position, 0, {
              text: inputValue,
              selected: true,
              disabled: false,
              hidden: false,
            });
            resetManagement();
            $management.bsMultiSelect("UpdateData");
            if (getIsAttached()) {
              callMs("#languages1-id", function (ms) {
                ms.updateOptionAdded(position);
              });
              callMs("#languages2-id", function (ms) {
                ms.updateOptionAdded(position);
              });
            }
          }
        }
      });
      if($(".alert-flag").attr("aType")) {
    	  alertify.notify($(".alert-flag").attr("aMessage"), $(".alert-flag").attr("aType"), 100, function(){  console.log('dismissed'); });
          alertify.set('notifier','position', 'top-right');
      }
      $("#zero_config_filter")
        .append(`<div class="search-bar-table d-flex align-items-stretch">
	        	    <div class="position-relative">
	                <button type="button" class="btn btn-green text-white btn-filter" data-toggle="collapse" data-target="#filter-table">
	                    <i class="fa-regular fa-filter-list"></i>
	                    <span class="text-white"></span>
	                </button>
	                <!-- filter table -->
	                <div class="card position-absolute text-start collapse shadow-lg end-100 top-0 filter-block" id="filter-table" style="z-index: 100; min-width: 24rem;">
	                    <div class="card-header p-2 fs-5 green-color" style="background-color: #c4f0d5">
	                        Bộ lọc
	                    </div>
	                    <div class="card-body">
	                        <form action="admin/sale/index.htm" method="post" class="row g-3" id="form-filter">
	                            <div class="col-12 mt-0 px-0">
	                                <label for="input-start-date" class="form-label">Ngày bắt đầu</label>
	
	                                <div class="col-12 px-0 d-flex gap-1 justify-content-around align-items-stretch">
	                                    <div class="input-group">
	                                        <input type="date" name="ngayBDLeft" class="form-control" />
	                                    </div>
	                                    <button type="button" class="btn btn-green btn-sm btn-range-filter" data-toggle="collapse" data-target="#input-start-date-right">
	                                        Đến
	                                    </button>
	
	                                    <div class="input-group collapse range-filter-right" id="input-start-date-right">
	                                        <input type="date" name="ngayBDRight" class="form-control" />
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-12 mt-0 px-0">
	                                <label for="input-start-date" class="form-label">Ngày kết thúc </label>
	
	                                <div class="col-12 px-0 d-flex gap-1 justify-content-around align-items-stretch">
	                                    <div class="input-group">
	                                        <input type="date" name="ngayKTLeft" class="form-control" />
	                                    </div>
	                                    <button type="button" class="btn btn-green btn-sm btn-range-filter" data-toggle="collapse" data-target="#input-end-date-right">
	                                        Đến
	                                    </button>
	
	                                    <div class="input-group collapse range-filter-right" id="input-end-date-right">
	                                        <input type="date" class="form-control" name="ngayKTRight" />
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-md-12 px-0">
	                                <label for="inputAddress" class="form-label">Trạng thái</label>
	                                <div class="col-md-12 d-flex px-0">
	                                    <div class="form-check pl-1">
	                                        <input name="trangThai" type="radio" class="form-check-input-filter invisible position-absolute" id="trangThai" value="2" checked />
	                                        <label class="py-1 px-2" for="trangThai">
	                                            Tất cả
	                                        </label>
	                                    </div>
	                                    <div class="form-check pl-1">
	                                        <input name="trangThai" type="radio" class="form-check-input-filter invisible position-absolute" id="trangThai0" value="0" />
	                                        <label class="form-check-label py-1 px-2" for="trangThai0">
	                                            <div class="d-inline">Hết hiệu lực</div>
	                                        </label>
	                                    </div>
	                                    <div class="form-check pl-1">
	                                        <input value="1" name="trangThai" type="radio" class="form-check-input-filter invisible position-absolute" id="trangThai1" />
	                                        <label class="form-check-label py-1 px-2" for="trangThai1">
	                                            <div class="d-inline">Còn hiệu lực</div>
	                                        </label>
	                                    </div>
	                                </div>
	                            </div>
	                        </form>
	                    </div>
	                    <div class="card-footer text-end p-2">
	                        <button type="submit" form="form-filter" name="btnFilter" class="btn btn-green">
	                            Lọc
	                        </button>
	                        <button type="reset" class="btn btn-secondary mb-0">
	                            Đặt lại
	                        </button>
	                    </div>
	                </div>
	            </div>
	        </div>`);
    </script>
	<script src=" <c:url value='/resources/admin/dist/js/saleProduct.js'/>">
	</script>
	<script src=" <c:url value='/resources/js/autoOpenModal.js'/>">
	</script>




</body>
</html>