# Correção Portable — revisão 2

Esta revisão corrige a validação do runtime gerado pelo Compose Desktop/jpackage.

## Correção principal

O workflow anterior exigia `runtime/bin/java.exe`. Essa exigência é incorreta para uma imagem `jlink` criada pelo `jpackage`: o launcher Windows carrega diretamente a JVM embarcada por `runtime/bin/server/jvm.dll`.

Agora o CI:

1. executa os testes;
2. gera `createDistributable` no Windows;
3. preserva a imagem criada pelo Compose/jpackage sem remontar `app/` ou `runtime/`;
4. valida o EXE, `app/`, `runtime/` e `jvm.dll`;
5. abre o `MonitorDeNoticias.exe` no runner Windows;
6. somente publica se o processo permanecer aberto;
7. entrega somente o formato portátil.

A Release continua criando exatamente um `MonitorDeNoticias-Portable-Windows.zip`.
