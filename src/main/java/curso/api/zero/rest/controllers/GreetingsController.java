package curso.api.zero.rest.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import curso.api.zero.rest.model.Usuario;
import curso.api.zero.rest.repository.UsuarioRepository;

/**
 *
 * A sample greetings controller to return greeting text
 */
@Controller
public class GreetingsController {
    /**
     *
     * @param name the name to greet
     * @return greeting text
     */
	@Autowired
	private UsuarioRepository usuarioRepository;
    
    @PostMapping(value = "inserir")
    @ResponseBody
    public ResponseEntity<Usuario> inserir(@RequestBody Usuario usuario){
    	Usuario user = usuarioRepository.save(usuario);
    	return new ResponseEntity<Usuario>(user,HttpStatus.OK);
    }
    @GetMapping(value = "listar")
    @ResponseBody
    public ResponseEntity<List<Usuario>> listar(){
    	List<Usuario> user = usuarioRepository.findAll();
    	return new ResponseEntity<List<Usuario>>(user,HttpStatus.OK);
    }
    @GetMapping(value = "busca-id")
    @ResponseBody
    public ResponseEntity<Usuario> buscaPorId(@RequestParam(name = "iduser")Long iduser){
    	Usuario user = usuarioRepository.findById(iduser).get();
    	return new ResponseEntity<Usuario>(user,HttpStatus.OK);
    }
    @DeleteMapping(value = "delete")
    @ResponseBody
    public ResponseEntity<String> delete(@RequestParam(name = "iduser")Long iduser){
    	usuarioRepository.deleteById(iduser);
    	return new ResponseEntity<String>("Deletado com sucesso",HttpStatus.OK);
    }
    @PutMapping(value = "editar")
    @ResponseBody
    public ResponseEntity<?> editar(@RequestBody Usuario usuario){
    	if (usuario.getId()==null) {
    		return  new ResponseEntity<String>("Id não informado",HttpStatus.NOT_FOUND);
    	}
    	Usuario user = usuarioRepository.saveAndFlush(usuario);
    	return new ResponseEntity<Usuario>(user,HttpStatus.OK);
    }
    @GetMapping(value = "busca-nome")
    @ResponseBody
    public ResponseEntity<List<Usuario>> buscaNome(@RequestParam String name){
    	List<Usuario> user = usuarioRepository.findByNome(name.trim().toUpperCase());
    	return new ResponseEntity<List<Usuario>>(user,HttpStatus.OK);
    }
}
