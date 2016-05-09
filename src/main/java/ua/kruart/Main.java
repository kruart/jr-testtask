package ua.kruart;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import ua.kruart.dao.UserDao;
import ua.kruart.model.User;

import java.util.Date;
import java.util.List;

/**
 * Created by Arthur on 4/10/2016.
 */
public class Main {
    public static void main(String[] args) {
        ApplicationContext ap = new ClassPathXmlApplicationContext("application-context.xml");
        UserDao userDao = ap.getBean(UserDao.class);

//        User user = new User("Molly Hayes", 55, true, new Date());
//        user.setId(20);
//        userDao.update(user);
        List<User> users = userDao.getAllOfUsers();

        System.out.println(users.size());

        System.out.println("==========SAVE=========");
//        User byId = userDao.getById(20);
//        System.out.println(byId);

        User newUser = new User("art", 25, true, new Date());
        int i = userDao.save(newUser);
        System.out.println(i);
        users = userDao.getAllOfUsers();

        System.out.println(users.size());

        System.out.println("==========DELETE=========");
        userDao.delete(26);

        users = userDao.getAllOfUsers();

        System.out.println(users.size());

        users.forEach(System.out::println);
    }
}
