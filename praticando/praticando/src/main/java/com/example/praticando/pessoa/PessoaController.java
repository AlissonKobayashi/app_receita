package com.example.praticando.pessoa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pessoa")
public class PessoaController {

    @Autowired
    private PessoaService pessoaService;

    @GetMapping
    public List<PessoaDto> listAll(){
        return pessoaService.listarTodos();
    }

    @GetMapping("/{id}")
    public ResponseEntity<PessoaDto> listById(@PathVariable Long id){
        return pessoaService.listarById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<PessoaDto> create(@RequestBody PessoaDto pessoaDto){
        PessoaDto pessoaDto1 = pessoaService.criarPessoa(pessoaDto);
        return ResponseEntity.ok(pessoaDto1);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Void> editPessoa(@PathVariable Long id, @RequestBody PessoaDto pessoaDto){
        pessoaService.editarPessoa(id, pessoaDto);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletePessoa(@PathVariable Long id){
        pessoaService.deletarPessoa(id);
        return ResponseEntity.noContent().build();
    }
}
