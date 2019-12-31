<?php
$server='localhost';
$username='root';
$password='';
$databasename='db_penggajian';

$koneksi= mysqli_connect($server,$username,$password,$databasename);
    if($koneksi->connect_error){
        echo "Koneksi gagal : (" . $koneksi->connect_error. ")";
        
    }