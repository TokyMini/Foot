package etu1.Foot.controller;

import etu1.Foot.service.AttackService;
import etu1.Foot.stat.Attack;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/attacks")
public class AttackController {
    @Autowired
    AttackService serv;

    @GetMapping("/home")
    public List<Attack> getHome(){
        return serv.getAll("Home");
    }

    @GetMapping("/away")
    public List<Attack> getAway(){
        return serv.getAll("Away");
    }

    @GetMapping("/overall")
    public List<Attack> getOverall(){
        return serv.getAll("Overall");
    }
}
