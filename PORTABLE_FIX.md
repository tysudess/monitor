# Correção Windows Portable

Esta versão foi ajustada para publicar somente a distribuição portátil.

## Mudanças

- `createDistributable` substitui `packageDistributionForCurrentOS`.
- MSI e instalador EXE não fazem parte do fluxo de entrega.
- `app/` e `runtime/` são preservados exatamente como o Compose/jpackage os gera.
- O workflow valida `runtime/bin/java.exe` e `runtime/bin/server/jvm.dll`.
- O workflow abre `MonitorDeNoticias.exe` por 12 segundos no runner Windows antes de publicar.
- Se o launcher encerrar imediatamente (por exemplo, `Failed to launch JVM`), o workflow falha e nenhum pacote defeituoso é entregue.
- No workflow de build não há ZIP manual: o artifact do GitHub é a única compactação.
- Na Release é criado apenas um `MonitorDeNoticias-Portable-Windows.zip`.

## Uso

Extraia o pacote inteiro. Execute `MonitorDeNoticias.exe` sem mover o EXE para fora da pasta. `app/` e `runtime/` devem permanecer ao lado dele.
