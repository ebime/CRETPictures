{* Template pour page d'accueil pour utilisateur connecté *}

{extends file="structure.tpl"}

{block name=title}eBime - Accueil{/block}

{block name=styles}<link rel="stylesheet" type="text/css" href="CSSFiles/structure.css"/>{/block}

{block name=img}<img src="images/logo_cret.png" alt="logo" title="logo" width="125px" />{/block}

{block name=encartConnexion}
    <br/><br/>
    <table>
        <tr>
            Bienvenu {$name|Default:""} sur votre compte!
        </tr><br/><br/>
        <tr>
            <a href="connexion.php?do=logout">Se déconnecter</a>
        <tr/>
    </table>
{/block}

{block name=menu}
    {if $perms[0] == true || $perms[1] == true || $perms[2] == true || $perms[3] == true}
    <h2>Administration</h2>
    <ul>
        {if $perms[0] == true}<li><a href="PagesSite/ajoutUser.php">Ajout user(s)</a></li>{/if}
        {if $perms[1] == true}<li><a href="#">Comptes user(s)</a></li>{/if}
        {if $perms[2] == true}<li><a href="PagesSite/updateUser.php">Mise à jour user(s)</a></li>{/if}
        {if $perms[3] == true}<li><a href="PagesSite/supprUser.php">Suppression user(s)</a></li>{/if}
    </ul>
    {/if}

    <h2>Gestion de profil</h2>
    <ul>
        <li><a href="#">Mon profil perso</a></li>
        <li><a href="#">Profils partagés</a></li>
    </ul>

    <h2>Gestion de photos</h2>
    <ul>
        <li><a href="PagesSite/mesPhotos.php">Mes photos</a></li>
    </ul>
{/block}

{block name=body}
    {if $perms[6] == true}
    <table>
        {foreach from=$tabPics item=photo}
            <td>
                <a href="PagesSite/apercuPhoto.php?img={$photo}"><img src="app/picture/{$photo}/thumb/255x255"/></a><br/>
                <img src="images/modif.gif" width="20px" onClick=""/>
                <img src="images/supp.gif" width="20px" onClick="confirm('Etes-vous sûr de vouloir supprimer ce fichier?')"/>
            </td>
        {/foreach}
    </table>
    {/if}
{/block}