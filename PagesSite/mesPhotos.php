<?php
/*
 * Description of index:
 * Page d'affichage des dossiers de photos et photos de l'utilisateur connecté
 *
 * @author Madeleine
 */
    require('../smarty/setup.php');
    $smarty = new Smarty_CRETPictures();
    
    require_once '../app/system.class.php';
    $sys = new System();
    
    require_once '../app/PicturesHandler.class.php';
    $phandler = new PicturesHandler($sys);
    
    $perms; //tableau qui stockera si l'utilisateur a certaines permissions
    $perms[0] = $sys->permissions_test('admin.user.create');
    $perms[1] = $sys->permissions_test('admin.user.read');
    $perms[2] = $sys->permissions_test('admin.user.update');
    $perms[3] = $sys->permissions_test('admin.user.delete');
    $perms[6] = $sys->permissions_test('admin.picture.read');
    $perms[7] = $sys->permissions_test('application.picture.upload');

    //aller chercher les photos de l'utilisateur connecté
    $usr = $sys->current_user();
    $photos = $phandler->pictures_getFolderByUserID($usr['id']);

    $smarty->assign('perms', $perms);
    $smarty->assign('tabPhotos', $photos);
    $smarty->assignByRef('picHandler',$phandler);
    
    if(isset($_GET['saisie']))
        $phandler->folders_create($_GET['saisie']);
    
    $pics;
    for($i = 0; $i < count($photos); $i++){
        if($photos[$i]['type'] == 'picture')
            $pics[$i] = $photos[$i]['pid'];
        }
    
    $smarty->assign('tabPics', $pics);
    
    $smarty->display('mesPhotos.tpl');
?>
