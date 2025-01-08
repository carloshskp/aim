# AIM - Gerenciador de Aplicativos .AppImage

Este projeto é um gerenciador de aplicativos para arquivos `.AppImage`, permitindo que os usuários instalem e removam aplicativos de forma interativa. O script principal (`main.sh`) coordena as operações de instalação e desinstalação, utilizando funções definidas em arquivos auxiliares.

## Estrutura do Projeto

- `main.sh`: Script principal que gerencia a instalação e remoção de arquivos `.AppImage`.
- `src/`: Diretório que contém os scripts auxiliares.
  - `file_manager.sh`: Gerencia operações relacionadas a arquivos e diretórios.
  - `icon_manager.sh`: Gerencia a seleção e conversão de ícones.
  - `appimage_manager.sh`: Contém as funções para instalar e desinstalar arquivos `.AppImage`.

## Pré-requisitos

- Bash
- `ffmpeg` (para conversão de ícones)
- Permissões de execução para os arquivos `.AppImage`

## Instalação

1. Clone o repositório ou baixe os arquivos.
2. Navegue até o diretório do projeto.
3. Execute o script principal:

   ```bash
   bash main.sh
   ```

## Uso

Ao executar `main.sh`, o usuário será apresentado com as seguintes opções:

1. **Instalar**: Permite ao usuário selecionar um arquivo `.AppImage` da pasta Downloads para instalação. O usuário pode escolher um ícone para o aplicativo ou usar um ícone padrão.
2. **Remover**: Permite ao usuário selecionar um atalho de aplicativo para desinstalação. O atalho, o arquivo `.AppImage` e o ícone associado serão removidos.

### Exemplo de Execução

1. **Inicie o Gerenciador de Aplicativos**: Execute o script principal.

   ```bash
   bash main.sh
   ```

2. **Selecione uma Opção**: O menu será exibido, permitindo que você escolha entre instalar ou remover um arquivo `.AppImage`.

   ```
   Deseja instalar ou remover um arquivo .AppImage?
   1) Instalar
   2) Remover
   ```

3. **Instalar um Aplicativo**: Se você escolher "Instalar", o script listará os arquivos `.AppImage` disponíveis na pasta Downloads.

   ```
   Selecione o arquivo .AppImage para instalar:
   1) aplicativo1.AppImage
   2) aplicativo2.AppImage
   ```

4. **Escolha um Arquivo**: Selecione o número correspondente ao arquivo que deseja instalar.

5. **Nome do Atalho**: O script solicitará que você insira um nome para o atalho ou pressione Enter para usar o nome padrão.

   ```
   Digite o nome do atalho (pressione Enter para usar 'aplicativo1'): 
   ```

6. **Selecione um Ícone**: O script perguntará se você deseja selecionar um ícone da pasta Downloads.

   ```
   Deseja selecionar um ícone da pasta Downloads? (s/n):
   ```

7. **Confirmação**: Após a instalação, uma mensagem de confirmação será exibida.

   ```
   Criado atalho para aplicativo1 em ~/.local/share/applications/aplicativo1.desktop
   ```

8. **Remover um Aplicativo**: Se você escolher "Remover", o script listará os atalhos existentes.

   ```
   Selecione o atalho do aplicativo .AppImage para desinstalar:
   1) aplicativo1.desktop
   2) aplicativo2.desktop
   ```

9. **Confirmação de Remoção**: Após selecionar o atalho, uma mensagem de confirmação será exibida.

   ```
   Aplicativo aplicativo1 desinstalado com sucesso.
   ```

10. **Atualização de Cache**: Após a instalação ou remoção, você pode ser aconselhado a atualizar o cache manualmente.

   ```
   Atualização de cache automática desativada para evitar congelamento. Atualize manualmente usando os comandos abaixo, se necessário:
   gtk-update-icon-cache
   update-desktop-database
   ```

## Estrutura de Diretórios

O script cria automaticamente os seguintes diretórios, se não existirem:

- `~/.local/share/applications`: Para armazenar os atalhos dos aplicativos.
- `~/.local/bin`: Para armazenar os arquivos `.AppImage`.
- `~/.local/share/icons/hicolor/128x128/apps`: Para armazenar os ícones dos aplicativos.

## Atualização de Cache

Após a instalação ou remoção de aplicativos, o usuário é aconselhado a atualizar manualmente o cache de ícones e o banco de dados de desktop usando os seguintes comandos:

```bash
gtk-update-icon-cache
update-desktop-database
```

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir um issue ou enviar um pull request.

## Licença

Este projeto está licenciado sob a MIT License. Veja o arquivo `LICENSE` para mais detalhes.

