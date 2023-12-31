#' @title Visualizing genes associated with CytoTRACE
#'
#' @description This function generates a bar plot to visualize genes associated with CytoTRACE.
#' At minimum, the ‘plotCytoGenes’ function takes as input a list object generated by either the ‘CytoTRACE’ or ‘iCytoTRACE’ functions.
#' Users can also indicate the number of genes and colors to display.
#'
#'cyto_obj = NULL, phenotype = NULL, gene = NULL, colors = NULL, emb = NULL
#' @param cyto_obj a list object generated by the 'CytoTRACE' or 'iCytoTRACE' functions
#' @param numOfGenes a numeric value indicating the number of genes to plot. default: 10
#' @param colors a two-item character vector, where the first color corresponds to the genes associated with least differentiated cells (high CytoTRACE) and second color to the genes associated with most differentiated cells (low CytoTRACE). default: c("darkred", "navyblue")
#' @param outputDir path to output directory where the plot will be written. Format should be "/PATH/TO/DIRECTORY/".
#'
#' @return a PDF of bar plots indicating the genes associated with least and most differentiated cells based on correlation with CytoTRACE.
#'
#' @author Gunsagar Gulati <cytotrace@gmail.com>
#'
#' @seealso https://cytotrace.stanford.edu
#'
#' @references https://doi.org/10.1101/649848
#'
#' @examples
#'
#' #Use the bone marrow 10x scRNA-seq dataset to run CytoTRACE
#' results <- CytoTRACE(marrow_10x_expr)
#'
#' #Run plotCytoTRACE
#' plotCytoGenes(results, numOfGenes = 10)
#'
#' @export

plotCytoGenes <- function(cyto_obj = NULL, numOfGenes = 10, colors = c("darkred", "navyblue"), outputDir = "./"){
  cytoGenes <- cyto_obj$cytoGenes
  top_k <- tail(sort(cytoGenes), numOfGenes)
  bottom_k <- head(sort(cytoGenes), numOfGenes)
  final_list <- data.frame(CytoGenes=c(top_k, bottom_k))
  final_list <- cbind(final_list, Gene=rownames(final_list))
  final_list <- final_list[order(final_list$CytoGenes),]

  p <- ggplot2::ggplot(data=final_list, ggplot2::aes(x=Gene, y=CytoGenes, color = CytoGenes, fill=CytoGenes)) +
    ggplot2::geom_bar(position = "dodge", stat="identity") +
    ggplot2::coord_flip() +
    ggplot2::scale_color_gradient(low=colors[2], high=colors[1], guide=F) +
    ggplot2::scale_fill_gradient(low= adjustcolor(colors[2],0.3), high = adjustcolor(colors[1], 0.3), guide = F)+
    ggplot2::scale_x_discrete(
      limits = final_list$Gene)+
    ggplot2::scale_y_continuous(breaks = as.numeric(formatC(round(signif(seq(round(min(cytoGenes, na.rm =T) - 0.05, 1),
                                                                    round(max(cytoGenes, na.rm =T) + 0.05, 1), 0.2),1),1), digits =1)))+
    ggplot2::ylab("Correlation with CytoTRACE") +
    ggplot2::theme(
      legend.title=ggplot2::element_blank(),
      legend.position = "none",
      legend.background = ggplot2::element_rect(),
      axis.text.x = ggplot2::element_text(color = "black", size = 15),
      axis.text.y = ggplot2::element_text(color = "black", size = 15),
      axis.title.x = ggplot2::element_text(color = "black", size = 20, margin = ggplot2::margin(t = 10, r = 0, b = 0, l = 0)),
      axis.title.y = ggplot2::element_text(color = "black", size= 20, margin = ggplot2::margin(t = 0, r = 20, b = 0, l = 0)),
      axis.ticks.x = ggplot2::element_line(color = "black"),
      axis.ticks.y = ggplot2::element_line(color = "black"),
      axis.ticks.length = ggplot2::unit(0.2, "cm"),
      strip.background = ggplot2::element_blank(),
      strip.text = ggplot2::element_text(colour = "black", size = 17),
      axis.line = ggplot2::element_line(colour = "black"),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      panel.border = ggplot2::element_blank(),
      panel.background = ggplot2::element_blank(),
      plot.margin = ggplot2::margin(t = 0.5, r = 0.5, b = 0.5, l = 0.5, unit = "cm"),
      panel.spacing.x = ggplot2::unit(1.5, "lines"))
  p
  pdf(paste0(outputDir, "CytoGenes.pdf"), width = 7, height = numOfGenes/1.75)
  print(p)
  dev.off()
}
