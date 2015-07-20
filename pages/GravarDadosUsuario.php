<?php
require_once '../class/Usuario.class.php';
require_once '../dao/UsuarioDao.class.php';
require_once '../class/FabricaDeConexao.class.php';


if(!empty($_POST))
{
	 $usuario = new Usuario();
	  $usuario->nome = $_POST["nome"];
	  $usuario->sobrenome = $_POST["sobrenome"];
	  $usuario->senha = $_POST["senha"];
	  $usuario->email = $_POST["email"];
	  $usuario->usuario = $_POST["usuario"];
	  $usuario->senha = $_POST["senha"];
	  $usuario->data_nascimento = $_POST["data_nascimento"];
	  $usuario->cep = $_POST["cep"];
	  $usuario->endereco = $_POST["endereco"];
	  $usuario->bairro = $_POST["bairro"];
	  $usuario->cidade= $_POST["cidade"];
	  $usuario->uf = $_POST["uf"];
	  $usuario->pais = $_POST["pais"];
	  $usuario->telefone_fixo = $_POST["telefone_fixo"];
	  $usuario->telefone_movel= $_POST["telefone_movel"];
	  
	  $usuario-adicionar($usuario);
	  
	  
	  
	  
	  
	  
	  
	  
	  
}

 