package edu.nju.dessert.controller;

import edu.nju.dessert.interceptor.Auth;
import edu.nju.dessert.interceptor.Role;
import edu.nju.dessert.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
    Map<String, Object> getOrder(HttpServletRequest req, @RequestParam("id") int id) {
        Map<String, Object> map = new HashMap<>();
        map.put("order", orderService.getOrderById(id));
        return map;
    }

    @Auth(Role.USER)
    @RequestMapping(value="/cancel", method= RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> cancelOrder(HttpServletRequest req, @RequestParam("id") int id) {
        int uid = (int) req.getSession().getAttribute("id");
        Map<String, Object> map = new HashMap<>();
        int result = orderService.cancelOrder(uid, id);
        map.put("result", result);
        return map;
    }

}
