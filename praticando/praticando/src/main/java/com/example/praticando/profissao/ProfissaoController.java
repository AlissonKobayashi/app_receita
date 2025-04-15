package com.example.praticando.profissao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/profissao")
public class ProfissaoController {

    @Autowired
    private ProfissaoService profissaoService;

    @GetMapping
    public List<ProfissaoDto> listAll(){
        return profissaoService.listarTodos();
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProfissaoDto> listById(@PathVariable Long id){
        return profissaoService.listarById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<ProfissaoDto> create(@RequestBody ProfissaoDto profissaoDto){
        ProfissaoDto profissaoDto1 = profissaoService.criarProfissao(profissaoDto);
        return ResponseEntity.ok().body(profissaoDto1);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Void> editProfissao(@PathVariable Long id, @RequestBody ProfissaoDto profissaoDto){
        profissaoService.editarProfissao(id, profissaoDto);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProfissao(@PathVariable Long id){
        profissaoService.deletarProfissao(id);
        return ResponseEntity.noContent().build();
    }
}
