
/**
 * 加入购物车
 */
function buy(goodid){
	$.post("goods_buy", {goodsid:goodid}, function(data){
		if(data=="ok")
		{
			// 判断是否在购物车页面 - 更准确的判断方式
			var pathname = window.location.pathname;
			var href = window.location.href;
			var isCartPage = pathname.indexOf('flowers_cart') !== -1 || 
			                 pathname.indexOf('cart') !== -1 ||
			                 href.indexOf('flowers_cart') !== -1;
			var message = isCartPage ? "数量已增加!" : "添加到购物车!";
			
			if(isCartPage) {
				// 在购物车页面，刷新库存信息
				refreshStock(goodid);
			}
			
			layer.msg(message, {time:800}, function(){
               if(!isCartPage) {
                   location.reload();
               } else {
                   // 购物车页面只刷新当前商品的数量显示
                   location.reload();
               }
            });
		}
		else if(data.startsWith("stock_insufficient:"))
		{
			// 提取库存数量
			var stock = data.split(":")[1];
			layer.msg("购买数量超过库存！当前库存数量为：" + stock + "，请调整购买数量！", {
				time: 3000,
				icon: 0
			});
			// 显示警告信息
			$('#warning-' + goodid).text('库存不足，最多可购买 ' + stock + ' 件').show();
			// 刷新库存显示
			refreshStock(goodid);
		}
		else if(data=="stock_empty")
		{
			layer.msg("该商品库存不足，无法购买！", {
				time: 2000,
				icon: 0
			});
			// 显示警告信息
			$('#warning-' + goodid).text('库存不足，无法购买').show();
			// 刷新库存显示
			refreshStock(goodid);
		}
		else if(data=="fail")
		{
            layer.msg("库存不足,请购买其他商品!", {time:800}, function(){

            });
		}
		else if(data=="login")
		{
			layer.msg("请先登录后再加入购物车!", {
				time: 2000,
				icon: 0
			}, function(){
				// 跳转到登录页面
				window.location.href = "user_login";
			});
		}
		else
		{
			layer.msg("请先登录后再加入购物车!", {time:800});
		}
	});
}

/**
 * 刷新商品库存信息
 */
function refreshStock(goodsid) {
	$.get("goods_stock", {goodsid: goodsid}, function(stock) {
		$('#stock-' + goodsid).text(stock);
		// 检查当前数量是否超过库存
		var currentAmount = parseInt($('#amount-' + goodsid).val()) || 0;
		if (currentAmount > parseInt(stock)) {
			$('#warning-' + goodsid).text('购买数量(' + currentAmount + ')超过库存(' + stock + ')，请调整数量！').show();
		} else {
			$('#warning-' + goodsid).hide();
		}
	});
}

/**
 * 带库存检查的购买函数（用于购物车页面增加数量）
 */
function buyWithStockCheck(goodsid, currentStock) {
    // 获取当前数量
    var currentAmount = parseInt($('#amount-' + goodsid).val()) || 0;
    
    // 检查增加后是否超过库存
    if (currentAmount + 1 > currentStock) {
        layer.msg("购买数量超过库存！当前库存数量为：" + currentStock + "，您已选择：" + currentAmount + " 件，无法再增加！", {
            time: 3000,
            icon: 0
        });
        // 显示警告信息
        $('#warning-' + goodsid).text('库存不足，最多可购买 ' + currentStock + ' 件').show();
        return;
    }
    
    // 隐藏警告信息
    $('#warning-' + goodsid).hide();
    
    // 如果库存充足，调用buy函数
    buy(goodsid);
}

function lessen(goodsid){
    $.post("flowers_lessen", {goodsid:goodsid}, function(data){
        if(data=="ok"){
            // 隐藏警告信息（如果存在）
            $('#warning-' + goodsid).hide();
            layer.msg("数量已减少!", {time:800}, function(){
                location.reload();
            });
        } else if(data=="login"){
            layer.msg("请先登录后再操作!", {
                time: 2000,
                icon: 0
            }, function(){
                window.location.href = "user_login";
            });
        } else {
            layer.msg("操作失败，请重试!", {time:800});
        }
    });
}
/**
 * 购物车删除
 */
function deletes(goodid){
    layer.confirm('确定要删除这个商品吗？', {
        btn: ['确定', '取消'],
        icon: 3,
        title: '提示'
    }, function(index){
        $.post("flowers_delete", {goodsid:goodid}, function(data){
            if(data=="ok"){
                layer.msg("删除成功!", {time:800}, function(){
                    location.reload();
                });
            } else if(data=="login"){
                layer.msg("请先登录后再操作!", {
                    time: 2000,
                    icon: 0
                }, function(){
                    window.location.href = "user_login";
                });
            } else {
                layer.msg("删除失败，请重试!", {time:800});
            }
        });
        layer.close(index);
    });
}