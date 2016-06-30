package edu.nju.dessert.controller;

import edu.nju.dessert.interceptor.Auth;
import edu.nju.dessert.interceptor.Role;
import edu.nju.dessert.service.OrderService;
import edu.nju.dessert.vo.OrderVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value="/order")
public class OrderController {

    private OrderService orderService;

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @Auth(Role.USER)
    @RequestMapping(value="/get", method= RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getOrder(HttpServletRequest req, @RequestParam int id) {
        Map<String, Object> map = new HashMap<>();
        OrderVO orderVO = orderService.getOrderById(id);
        map.put("order", orderVO);
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String minDate = df.format(new Date(date.getTime() + 1 * 24 * 60 * 60 * 1000));
        String maxDate = df.format(new Date(date.getTime() + 7 * 24 * 60 * 60 * 1000));
        map.put("minDate", minDate);
        map.put("maxDate", maxDate);
        return map;
    }

    @Auth(Role.USER)
    @RequestMapping(value="/cancel", method= RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> cancelOrder(HttpServletRequest req, @RequestParam int id) {
        int uid = (int) req.getSession().getAttribute("id");
        Map<String, Object> map = new HashMap<>();
        int result = orderService.cancelOrder(uid, id);
        map.put("result", result);
        return map;
    }

    @Auth(Role.USER)
    @RequestMapping(value="/again", method= RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> orderAgain(HttpServletRequest req, @RequestParam int id, @RequestParam String date,
                                   @RequestParam int type) {
        Map<String, Object> map = new HashMap<>();
        int result = orderService.orderAgain(id, date, type);
        map.put("result", result);
        return map;
    }

}
