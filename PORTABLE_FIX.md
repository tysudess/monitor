# Correção Portable v3

Esta revisão corrige a causa provável do diálogo **Failed to launch JVM** no início do aplicativo.

- adiciona explicitamente `slf4j-api` e `slf4j-nop` 1.7.36, exigidos pelo `sqlite-jdbc` durante a inicialização;
- força `Class.forName("org.sqlite.JDBC")` antes de abrir a interface;
- usa `jpackage.app-path` para localizar a pasta portátil corretamente;
- registra qualquer exceção de startup em `data/logs/startup-error.log`;
- inclui um `--smoke-test` que instancia os bancos e o controlador;
- o workflow executa o próprio EXE com `--smoke-test` e só publica se ele retornar código 0;
- inclui DLLs de runtime MSVC do JDK quando disponíveis;
- continua gerando somente um artefato Portable, sem instalador.
