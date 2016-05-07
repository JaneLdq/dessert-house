<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugins/jquery-modal/jquery.modal.css" type="text/css" media="screen" />
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<title>会员卡充值 - 恬</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/nav.jsp"></jsp:include>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/jsp/common/left_nav.jsp"></jsp:include>
		<div class="right main">
			<div class="panel charge-panel">
				<a class="right back" href="<%=request.getContextPath()%>/user/vip">返回</a>
				<div class="panel-title">
					<c:choose>
						<c:when test="${member.state==0}">会员卡激活</c:when>
						<c:when test="${member.state==2}">会员卡恢复</c:when>
						<c:otherwise>会员卡充值</c:otherwise>
					</c:choose>
				</div>
				<div class="separator"></div>
				<c:if test="${member.state==0}">
					<span class="highlight">您的会员卡${member.mid}尚未激活，激活后才可以享受在线购买便利哦~</span>
				</c:if>
				<div class="tips">
					<c:choose>
						<c:when test="${member.state==0}">
							<ul>
								<li>首次充值至少<span class="highlight"><i class="fa fa-rmb"></i> 200</span>
								即可激活会员卡，享受消费积分兑换优惠</li>
								<li>首次充值至少<span class="highlight"><i class="fa fa-rmb"></i> 500</span>
								可激活会员卡并直升至VIP1级，解锁<span class="highlight">9.5</span>折优惠</li>
								<li>首次充值至少<span class="highlight"><i class="fa fa-rmb"></i> 900</span>
								可激活会员卡并直升至VIP2级，解锁<span class="highlight">8.8</span>折优惠</li>
								<li>首次充值至少<span class="highlight"><i class="fa fa-rmb"></i> 1500</span>
								可激活会员卡并直升至VIP最高级，解锁<span class="highlight">7</span>折优惠，节假日更有特别大礼包赠送噢~</li>
							</ul>
						</c:when>
						<c:when test="${member.state==2}">
							<ul>
								<li>恢复会员卡原等级激活态需要充值至少<span class="highlight"><i class="fa fa-rmb"></i> 200</span></li>
							</ul>
						</c:when>
						<c:when test="${member.state!=3}">
							<ul>
								<li>累计充值至少<span class="highlight"><i class="fa fa-rmb"></i> 600</span>
								将升级为VIP1级，解锁<span class="highlight">9.5</span>折优惠</li>
								<li>累计充值至少<span class="highlight"><i class="fa fa-rmb"></i> 1000</span>
								将升级为VIP2级，解锁<span class="highlight">8.8</span>折优惠</li>
								<li>累计充值至少<span class="highlight"><i class="fa fa-rmb"></i> 1800</span>
								将升级为VIP最高级，解锁<span class="highlight">7</span>折优惠，节假日更有特别大礼包赠送噢~</li>
								<li>每次充值金额不得少于<span class="highlight"><i class="fa fa-rmb"></i> 50</span></li>
							</ul>
                        </c:when>
						<c:otherwise>
                            <div>对不起，您的会员卡已停用，不可再进行充值服务！</div>
                        </c:otherwise>
					</c:choose>
					
				</div>
                <c:if test="${member.state!=3}">
				<div class="section">
					<div class="sub-title">
						<c:choose>
						<c:when test="${member.state==0}">会员卡激活</c:when>
						<c:when test="${member.state==2}">会员卡恢复</c:when>
						<c:otherwise>会员卡充值</c:otherwise>
						</c:choose>
					</div>
					<div class="sub-content">
						<form method="POST" id="js-charge-form">
							<ul class="info-list">
								<li><label>银行卡号：</label><span class="value">
									${member.bank_card}</span></li>
								<li><label>支付密码：</label><span class="value">
									<input type="password" name="password" required></span></li>
								<li><label>充值金额：</label><span class="value">
								<c:choose>
									<c:when test="${member.state!=1}"><input type="number" name="value" required min="200"></c:when>
									<c:otherwise><input type="number" name="value" required min="50"></c:otherwise>
								</c:choose>
								</span></li>
							</ul>
							<input type="reset" style="display:none;" id="js-reset" />
							<c:choose>
								<c:when test="${member.state==0}">
									<button class="btn btn-submit" type="button" id="js-submit" method="activate">激活</button>
								</c:when>
								<c:when test="${member.state==2}">
									<button class="btn btn-submit" type="button" id="js-submit" method="recover">恢复</button>
								</c:when>
								<c:otherwise>
									<button class="btn btn-submit" type="button" id="js-submit" method="charge">充值</button>
								</c:otherwise>
							</c:choose>
						</form>
					</div>
					<div class="clear-fix"></div>
				</div>
                </c:if>
			</div>
		</div>
	</div>
	
	<div class="modal common-modal msg-modal" id="charge-msg-modal" style="display:none">
		<a href="#close" rel="modal:close" class="modal-close"><i class="fa fa-close fa-fw"></i></a>
		<div class="modal-content">(≧∇≦)ﾉ  充值成功！</div>
	</div>
	
	<script src="<%=request.getContextPath() %>/plugins/jquery-modal/jquery.modal.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath()%>/js/charge.js"></script>
</body>