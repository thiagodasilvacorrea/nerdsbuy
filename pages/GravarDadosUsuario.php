<?php
require_once '../class/Usuario.class.php';
require_once '../dao/UsuarioDao.class.php';
require_once '../class/FabricaDeConexao.class.php';


if(!empty($_POST["usuario"])&&!empty($_POST["senha"])&&!empty($_POST["cpf
"])&& !empty($_POST["sobrenome"])&&!empty($_POST["email"])&&!empty($_POST["data_nascimento"])&&!empty($_POST["cep"])&&!empty($_POST["endereco"])&&!empty($_POST["bairro"])&&!empty($_POST["cidade"])&&!empty($_POST["uf"])&&!empty($_POST["pais"])&&!empty($_POST["telefone_fixo"])&&!empty($_POST["telefone_movel"]))
{
	 $usuario = new Usuario();
	  $usuario->nome = $_POST["nome"];
	  $usuario->sobrenome = $_POST["sobrenome"];
	  $usuario->cpf= $_POST["cpf"];
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
	  
	 $db = new UsuarioDao();
	 $db->adicionar($usuario);
	  
	  
	  
	  
	  
	  
	  
	  
	  
}
else
{
	echo "usuario esta vazio!";
}

 