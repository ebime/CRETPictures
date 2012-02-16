{* Template pour page d'aperçu de photo *}

{extends file="structure.tpl"}

{block name=title}eBime - Visualisation Profil{/block}

{block name=styles}<link rel="stylesheet" type="text/css" href="CSSFiles/structure.css"/>{/block}

{block name=img}<img src="../images/logo_cret.png" alt="logo" title="logo" width="125px" />{/block}

{block name=lien}<a href="../index.php">eBime Pictures - A new way of sharing your pics!</a>{/block}

{* ___________________________________________ BLOCK ENCART CONNEXION ___________________________________________ *}

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

{* _________________________________________________ BLOCK MENU _________________________________________________ *}

{block name=menu}
    <h2><a href="filtrePhotos.php">Filtre photo</a></h2>

    {if $perms[0] == true || $perms[1] == true || $perms[2] == true || $perms[3] == true}
    <h2>Administration</h2>
    <ul>
        {if $perms[0] == true}<li><a href="ajoutUser.php">Ajout user(s)</a></li>{/if}
        {if $perms[2] == true}<li><a href="updateuser.php">Mise à jour user(s)</a></li>{/if}
    </ul>
    {/if}

    <h2>Gestion de profil</h2>
    <ul>
        <li><a href="monProfil.php">Mon profil perso</a></li>
        <li><a href="mesProfils.php">Profils partagés</a></li>
    </ul>

    {if $perms[5] == true}
    <h2>Gestion de photos</h2>
    <ul>
        <li><a href="mesPhotos.php?currentFolder=">Mes photos</a></li>
    </ul>
    {/if}
{/block}

{* _________________________________________________ BLOCK BODY _________________________________________________ *}

{block name=body}
    <br/><br/>
    <table>
        <tr>
            <td>Nom : </td><td>{$profil['lastName']}</td>
        </tr>
        <tr>
            <td>Prenom : </td><td>{$profil.firstName}</td>
        </tr>
        <tr>
            <td>Date de naissance : </td><td>{$profil.birth}</td>
        </tr>
        <tr>
            <td>Sexe : </td><td>{$profil.gender}</td>
        </tr>
        <tr>
            <td>Surnom : </td><td>{$profil.nickName}</td>
        </tr>
        <tr>
            <td>Email : </td><td>{$profil.email}</td>
        </tr>
        <tr>
            <td>Num téléphone : </td><td>{$profil.phone}</td>
        </tr>
    </table>

    <br/><br/>
    <table>
        <tr>
            <td><a href="apercuProfil.php?profil={$profilID}&do=modify">
                <input type="button" value="Modifier le profil"/>
            </a></td>
            <td><a href="../index.php?suppProfil={$profilID}">
                <input type="button" value="Supprimer le profil"
                    onClick="confirm('Voulez-vous vraiment supprimer ce profil?');"/>
            </a></td>
        </tr>
    </table>
{/block}