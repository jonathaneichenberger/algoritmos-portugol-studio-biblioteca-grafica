programa
{
    inclua biblioteca Graficos --> g
    inclua biblioteca Teclado --> t
    inclua biblioteca Util --> u

    const inteiro tamanho = 5
    inteiro graficoazul = 0, grafico_vermelho = 0
    inteiro numeros[tamanho], livros = 0, x = 0 , y = 0
    cadeia livros2[10]

    inteiro temp_img = 0
    inteiro mesa = 0
    inteiro livro = 0

    funcao desenhar(){
        
        

        para(inteiro i = 1; i <= livros; i++)
        {
            g.desenhar_imagem( 600, (500 -(30*i)), livro)

        }
    }

    funcao inicio(){

        x = 350
        y = 605


        temp_img = g.carregar_imagem("imagem/mesa_.png")
        mesa = g.redimensionar_imagem(temp_img, 1200, 800, verdadeiro)
        g.liberar_imagem(temp_img)

        temp_img = g.carregar_imagem("imagem/livro.png")
        livro = g.redimensionar_imagem(temp_img, 100, 100, verdadeiro)
        g.liberar_imagem(temp_img)
        
        g.definir_cor(0xCADB2C)
        //g.limpar()
        g.desenhar_imagem(0, 0, mesa)


        escreva("quantos livros deseja adicionar?")
        leia(livros)


        g.iniciar_modo_grafico(verdadeiro)
        g.definir_dimensoes_janela(1200, 800)

        enquanto(nao t.tecla_pressionada(t.TECLA_ESC)){
            desenhar()
            g.renderizar()
        }
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1003; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */