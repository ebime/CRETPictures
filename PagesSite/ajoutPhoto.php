<?php
/**
 * Description of ajoutPhoto:
 * Page d'ajout de photo
 *
 * @author Madeleine
 */
    require('../smarty/setup.php');
    $smarty = new Smarty_CRETPictures();
    require_once('../app/system.class.php');
    $sys = new System();
    
    $perms; //tableau qui stockera si l'utilisateur a certaines permissions
    $perms[0] = $sys->permissions_test('admin.user.create');
    $perms[1] = $sys->permissions_test('admin.user.read');
    $perms[2] = $sys->permissions_test('admin.user.update');
    $perms[3] = $sys->permissions_test('admin.user.delete');
    $perms[4] = $sys->permissions_test('admin.picture.read');
    $perms[5] = $sys->permissions_test('application.picture.upload');
    
    if($sys->current_user() != null){
        $usr = $sys->current_user();
        $smarty->assign('name', $usr['login']);
    }
    else    $smarty->assign('name', "");
    
    $smarty->assign('perms', $perms);
    if(isset($_GET['currentFolder']))   $smarty->assign ('currentFolder', $_GET['currentFolder']);
    
    $smarty->display('ajoutPhoto.tpl');
    
    if(isset($_GET['do']) && $_GET['do'] == 'ajout'){
        require_once('../app/PicturesHandler.class.php');
        $phandler = new PicturesHandler($sys);

        $photo = $_FILES['photoFile']['tmp_name'];

        if(isset($_POST['titlePic']) && $_POST['titlePic'] != ""){
            $extension = strrchr($_POST['titlePic'],".");
            
            //vérification de l'extension
            if($extension == FALSE || 
                    ($extension != 'jpg' && $extension != 'png' && $extension != 'gif' && $extension != 'bmp')){
                $extensionInit = strrchr($_FILES['photoFile']['name'],".");
                $POST['titlePic'] = $_POST['titlePic'].$extensionInit;
                
                if($_GET['currentFolder'] == "")    $fullname = $_POST['titlePic'];
                else    $fullname = substr($_GET['currentFolder'], 1).'/'.$_POST['titlePic'];
                $phandler->pictures_upload($fullname, $photo);
            }
            else{
                if($_GET['currentFolder'] == "")    $fullname = $_POST['titlePic'];
                else    $fullname = substr($_GET['currentFolder'], 1).'/'.$_POST['titlePic'];
                $phandler->pictures_upload($fullname, $photo);
            }
        }
        else{
            if($_GET['currentFolder'] == "")    $fullname = $_FILES['photoFile']['name'];
            else    $fullname = substr($_GET['currentFolder'], 1).'/'.$_FILES['photoFile']['name'];
            $phandler->pictures_upload($fullname, $photo);
        }
    }
?>