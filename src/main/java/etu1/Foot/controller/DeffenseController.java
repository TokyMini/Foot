package etu1.Foot.controller;

import etu1.Foot.service.DeffenseService;
import etu1.Foot.stat.Deffense;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/defenses")
public class DeffenseController {
    @Autowired
    DeffenseService serv;

    @GetMapping("/home")
    public List<Deffense> getHome(){
        return serv.getAll("Home");
    }

    @GetMapping("/away")
    public List<Deffense> getAway(){
        return serv.getAll("Away");
    }

    @GetMapping("/overall")
    public List<Deffense> getOverall(){
        return serv.getAll("Overall");
    }
}
