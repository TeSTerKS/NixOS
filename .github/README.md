<h1 align="center">
   <img src="assets/nixos-logo.png" width="100px" /> 
   <br>
      My NixOS System (Fork )
   <br>
      <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px" /> <br>
   <div align="center">

   <div align="center">
      <p></p>
      <div align="center">
         <a href="https://github.com/Sly-Harvey/NixOS/stargazers">
            <img src="https://img.shields.io/github/stars/Sly-Harvey/NixOS?color=F5BDE6&labelColor=303446&style=for-the-badge&logo=starship&logoColor=F5BDE6">
         </a>
         <a href="https://github.com/Sly-Harvey/NixOS/network/members">
            <img src="https://img.shields.io/github/forks/Sly-Harvey/NixOS?color=C6A0F6&labelColor=303446&style=for-the-badge&logo=git&logoColor=C6A0F6" alt="GitHub Forks">
         </a>
         <!-- <a href="https://github.com/Sly-Harvey/NixOS/"> -->
         <!--    <img src="https://img.shields.io/github/repo-size/Sly-Harvey/NixOS?color=C6A0F6&labelColor=303446&style=for-the-badge&logo=github&logoColor=C6A0F6"> -->
         <!-- </a> -->
         <a = href="https://nixos.org">
            <img src="https://img.shields.io/badge/NixOS-Unstable-blue?style=for-the-badge&logo=NixOS&logoColor=91D7E3&label=NixOS&labelColor=303446&color=91D7E3">
            <!-- <img src="https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=303446&logo=NixOS&logoColor=white&color=91D7E3"> -->
         </a>
         <a href="https://github.com/Sly-Harvey/NixOS/blob/main/LICENSE">
            <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=313244&colorB=F5A97F&logo=unlicense&logoColor=F5A97F&"/>
         </a>
      </div>
      <br>
   </div>
</h1>

![Screenshot](assets/preview1.png)
![Screenshot](assets/preview2.png)
<details>
<summary>Больше Примеров</summary>

![Screenshot](assets/preview3.png)
![Screenshot](assets/preview4.png)
![Screenshot](assets/preview5.png)

</details>

# Установка
> [!Note]
> <p>Перед установкой следует просмотреть переменные конфигурации в `flake.nix`.<br>
> Также проверьте импорт в верхней части `hosts/Default/configuration.nix`</p>
Вы можете использовать скрипт `install.sh` во время загрузки системы или в режиме живой установки.<br>
Если вы предпочитаете последний вариант, вы можете получить ISO-образ [тут](https://nixos.org/download/#nixos-iso).<br>
Рекомендуется ISO минимальной установки, но вы можете использовать любой вариант.

Оригинальный репозиторий.<br>

```bash
git clone https://github.com/Sly-Harvey/NixOS.git ~/NixOS
```
Мой репозиторий.<br>
```bash
git clone https://github.com/TeSTerKS/NixOS.git ~/NixOS
```

```bash
cd ~/NixOS
```
```bash
./install.sh
```

# Востановление
Существует 4 способа восстановления.<br>
1) Нажать **Super + U**.
2) Запустить `rebuild` в терминале
3) Выполнить скрипт `install.sh` повторно.
4) Запустить  `sudo nixos-rebuild switch --flake ~/NixOS#Default` если вы установили с live iso, то используйте /etc/nixos#Default 

Для просмотра списка сочетаний клавиш нажмите  **Super + ?** или **Super + Ctrl + K**

<details>
<summary>Как использовать оболочки разработки</summary>

- Чтобы инициализировать новый проект из шаблона:
```bash
nix flake init -t ~/NixOS#NAME
```
- В качестве альтернативы используйте ключевое слово `new` для создания нового каталога.:
```bash
nix flake new -t ~/NixOS#NAME PROJECT_NAME
```
Замените `NAME` любым шаблоном, определенным в `dev-shells/default.nix`.<br>
Эти команды создадут файлы flake.nix и flake.lock в каталоге вашего проекта.<br>
Чтобы войти в оболочку разработки:
- Используйте direnv, если он настроен, или перейдите в каталог проекта и выполните:
```bash
nix develop
```
</details> 

<!-- </details> -->
<!-- <summary>Credits/Inspiration</summary> -->

### Credits/Inspiration
| Credit                                                              |  Reason                                |
|---------------------------------------------------------------------|----------------------------------------|
| [Hyprland-Dots](https://github.com/JaKooLit/Hyprland-Dots)          | Script и Waybar шаблоны            |
| [HyDE](https://github.com/HyDE-Project/HyDE)                        | Еще несколько полезных скриптов               |
| [rofi](https://github.com/adi1090x/rofi)                            | Rofi launcher шаблоны                |
| [dev-templates](https://github.com/the-nix-way/dev-templates)       | Development шаблоны                  |
| [Vimjoyer](https://www.youtube.com/@vimjoyer)                       | Короткие, простые и содержательные руководства и информация |

<!-- </details> -->

<details>
<summary>Star History Оригинального репозитория</summary>
<a href="https://github.com/Sly-Harvey/NixOS/stargazers">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=Sly-Harvey/NixOS&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=Sly-Harvey/NixOS&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=Sly-Harvey/NixOS&type=Date" />
 </picture>
</a>
</details>
