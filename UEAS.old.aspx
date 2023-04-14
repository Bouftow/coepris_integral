<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="UEAS.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <style>
        table {
            border-collapse: collapse;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 3px;
        }
        .timepicker{
             width: 100px;
        }

    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMenus" runat="Server">
    <%=Usuarios.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
    <%=UsuariosOS.ShowMenu(User.Identity.Name,String.Format("default.default.-1"),this.Page) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" runat="Server">



    <!-- Todos los Modal -->
    <div class="modal fade" id="ModalSolLicSan" tabindex="-1" role="dialog" aria-labelledby="ModalSolLicSanlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header jus" >
                    <h5 class="modal-title" id="ModalSolLicSanlabel">Solicitud de Licencia Sanitaria</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileSolLicSan" name="FileSolLicSan[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upSolLicSan" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalAlta" tabindex="-1" role="dialog" aria-labelledby="ModalAltalabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalAltalabel">Alta ante S. A. T.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileAlta" name="FileAlta[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upAlta" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalPlanoMemoria" tabindex="-1" role="dialog" aria-labelledby="ModalPlanoMemorialabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalPlanoMemorialabel">Plano y Memoria Descriptiva</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FilePlanoMemoria" name="FilePlanoMemoria[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upPlanoMemoria" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalRelacionMaterialEquipo" tabindex="-1" role="dialog" aria-labelledby="ModalRelacionMaterialEquipolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalRelacionMaterialEquipolabel">Relación de Material y Equipo Existente</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileRelacionMaterialEquipo" name="FileRelacionMaterialEquipo[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upRelacionMaterialEquipo" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalPago" tabindex="-1" role="dialog" aria-labelledby="ModalPagolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalPagolabel">Pago</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FilePago" name="FilePago[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upPago" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalProgramaact" tabindex="-1" role="dialog" aria-labelledby="ModalProgramaactlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalProgramaactlabel">Programa de Actividades</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileProgramaact" name="FileProgramaact[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upProgramaact" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalFotocopiaconvenio" tabindex="-1" role="dialog" aria-labelledby="ModalFotocopiaconveniolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalFotocopiaconveniolabel">Copia Convenio P.G.J.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileFotocopiaconvenio" name="FileFotocopiaconvenio[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upFotocopiaconvenio" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalLibroRegistro" tabindex="-1" role="dialog" aria-labelledby="ModalLibroRegistrolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalLibroRegistrolabel">Libro Registro de Cadáveres</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileLibroRegistro" name="FileLibroRegistro[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upLibroRegistro" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalDescripcionTecnica" tabindex="-1" role="dialog" aria-labelledby="ModalDescripcionTecnicalabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalDescripcionTecnicalabel">Descripción de Técnica de Embalsamamiento</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileDescripcionTecnica" name="FileDescripcionTecnica[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upDescripcionTecnica" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalTarjetadecontrol" tabindex="-1" role="dialog" aria-labelledby="ModalTarjetadecontrollabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalTarjetadecontrollabel">Tarjeta De Control</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileTarjetadecontrol" name="FileTarjetadecontrol[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upTarjetadecontrol" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalCartaConsentimiento" tabindex="-1" role="dialog" aria-labelledby="ModalCartaConsentimientolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalCartaConsentimientolabel">Carta Consentimiento</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileCartaConsentimiento" name="FileCartaConsentimiento[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upCartaConsentimiento" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalActaConstitutiva" tabindex="-1" role="dialog" aria-labelledby="ModalActaConstitutivalabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalActaConstitutivalabel">Acta Constitutiva</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileActaConstitutiva" name="FileActaConstitutiva[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upActaConstitutiva" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalReglamentointerno" tabindex="-1" role="dialog" aria-labelledby="ModalReglamentointernolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalReglamentointernolabel">Reglamento Interno</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileReglamentointerno" name="FileReglamentointerno[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upReglamentointerno" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalVistobueno" tabindex="-1" role="dialog" aria-labelledby="ModalVistobuenolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalVistobuenolabel">Visto bueno protección civil.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileVistobueno" name="FileVistobueno[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upVistobueno" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalRelacionpersonal" tabindex="-1" role="dialog" aria-labelledby="ModalRelacionpersonallabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalRelacionpersonallabel">Relacion de personal y equipo.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileRelacionpersonal" name="FileRelacionpersonal[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upRelacionpersonal" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalAutorizaciondif" tabindex="-1" role="dialog" aria-labelledby="ModalAutorizaciondiflabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalAutorizaciondiflabel">Autorizacion D.I.F.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileAutorizaciondif" name="FileAutorizaciondif[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upAutorizaciondif" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalCedulaAutoeval" tabindex="-1" role="dialog" aria-labelledby="ModalCedulaAutoevallabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalCedulaAutoevallabel">Cedula de Autoevaluación</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileCedulaAutoeval" name="FileCedulaAutoeval[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upCedulaAutoeval" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalPapelMembretado" tabindex="-1" role="dialog" aria-labelledby="ModalPapelMembretadolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalPapelMembretadolabel">Papel Membretado</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FilePapelMembretado" name="FilePapelMembretado[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upPapelMembretado" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalAutorizacionset" tabindex="-1" role="dialog" aria-labelledby="ModalAutorizacionsetlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalAutorizacionsetlabel">Autorización S.E.T</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileAutorizacionset" name="FileAutorizacionset[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upAutorizacionset" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalUsodesuelo" tabindex="-1" role="dialog" aria-labelledby="ModalUsodesuelolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalUsodesuelolabel">Uso de suelo.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileUsodesuelo" name="FileUsodesuelo[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upUsodesuelo" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalProcesoLimpieza" tabindex="-1" role="dialog" aria-labelledby="ModalProcesoLimpiezalabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalProcesoLimpiezalabel">Proceso de Limpieza.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileProcesoLimpieza" name="FileProcesoLimpieza[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upProcesoLimpieza" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalRelacionTipo" tabindex="-1" role="dialog" aria-labelledby="ModalRelacionTipolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalRelacionTipolabel">Relacion tipo de análisis</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileRelacionTipo" name="FileRelacionTipo[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upRelacionTipo" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalSolicitud" tabindex="-1" role="dialog" aria-labelledby="ModalSolicitudlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalSolicitudlabel">Solicitud</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileSolicitud" name="FileSolicitud[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upSolicitud" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalTitulo" tabindex="-1" role="dialog" aria-labelledby="ModalTitulolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalTitulolabel">Título</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileTitulo" name="FileTitulo[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upTitulo" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalCedula" tabindex="-1" role="dialog" aria-labelledby="ModalCedulalabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalCedulalabel">Cédula</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileCedula" name="FileCedula[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upCedula" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalDiploma" tabindex="-1" role="dialog" aria-labelledby="ModalDiplomalabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalDiplomalabel">Diploma</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileDiploma" name="FileDiploma[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upDiploma" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalCurriculum" tabindex="-1" role="dialog" aria-labelledby="ModalCurriculumlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalCurriculumlabel">Curriculum.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileCurriculum" name="FileCurriculum[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upCurriculum" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalFotografias" tabindex="-1" role="dialog" aria-labelledby="ModalFotografiaslabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalFotografiaslabel">Fotografías.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileFotografias" name="FileFotografias[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upFotografias" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalPagoresponsable" tabindex="-1" role="dialog" aria-labelledby="ModalPagoresponsablelabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalPagoresponsablelabel">Pago de Responsable.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FilePagoresponsable" name="FilePagoresponsable[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upPagoresponsable" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div> 
    <div class="modal fade" id="ModalDictamenDocumental" tabindex="-1" role="dialog" aria-labelledby="ModalDictamenDocumentallabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalDictamenDocumentallabel">Evaluación Documental.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileDictamenDocumental" name="FileDictamenDocumental[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upDictamenDocumental" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>  
    <div class="modal fade" id="ModalAvisofunc" tabindex="-1" role="dialog" aria-labelledby="ModalAvisofunclabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalAvisofunclabel">Aviso de Funcionamiento.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileAvisofunc" name="FileAvisofunc[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upAvisofunc" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalDoctecatmedhosp" tabindex="-1" role="dialog" aria-labelledby="ModalDoctecatmedhosplabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalDoctecatmedhosplabel">Documentación del técnico en Atención Médica Prehospitalaria.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileDoctecatmedhosp" name="FileDoctecatmedhosp[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upDoctecatmedhosp" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalProgramamedico" tabindex="-1" role="dialog" aria-labelledby="ModalProgramamedicolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalProgramamedicolabel">Programa Médico.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileProgramamedico" name="FileProgramamedico[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upProgramamedico" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalCaracteristicasMecanicas" tabindex="-1" role="dialog" aria-labelledby="ModalCaracteristicasMecanicaslabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalCaracteristicasMecanicaslabel">Caracteristicas Mecánicas.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileCaracteristicasMecanicas" name="FileCaracteristicasMecanicas[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upCaracteristicasMecanicas" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalFotografiasdeUnidad" tabindex="-1" role="dialog" aria-labelledby="ModalFotografiasdeUnidadlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalFotografiasdeUnidadlabel">Fotografías de la Unidad.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileFotografiasdeUnidad" name="FileFotografiasdeUnidad[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upFotografiasdeUnidad" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalLicSanAnterior" tabindex="-1" role="dialog" aria-labelledby="ModalLicSanAnteriorlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalLicSanAnteriorlabel">Licencia Sanitaria Anterior.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileLicSanAnterior" name="FileLicSanAnterior[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upLicSanAnterior" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalAutorizacionResponsableAnterior" tabindex="-1" role="dialog" aria-labelledby="ModalAutorizacionResponsableAnteriorlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalAutorizacionResponsableAnteriorlabel">Autorización de Responsable Anterior.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileAutorizacionResponsableAnterior" name="FileAutorizacionResponsableAnterior[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upAutorizacionResponsableAnterior" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalAntecedentesNoPenales" tabindex="-1" role="dialog" aria-labelledby="ModalAntecedentesNoPenaleslabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalAntecedentesNoPenaleslabel">Carta de Antecedentes no penales.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileAntecedentesNoPenales" name="FileAntecedentesNoPenales[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upAntecedentesNoPenales" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalPolizaSeguro" tabindex="-1" role="dialog" aria-labelledby="ModalPolizaSegurolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalPolizaSegurolabel">Póliza Seguro.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FilePolizaSeguro" name="FilePolizaSeguro[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upPolizaSeguro" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalProgramaAlimentacion" tabindex="-1" role="dialog" aria-labelledby="ModalProgramaAlimentacionlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalProgramaAlimentacionlabel">Programa de Alimentación.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileProgramaAlimentacion" name="FileProgramaAlimentacion[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upProgramaAlimentacion" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalTitulo_MR" tabindex="-1" role="dialog" aria-labelledby="ModalTitulo_MRlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalTitulo_MRlabel">Título del Médico Responsable.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileTitulo_MR" name="FileTitulo_MR[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upTitulo_MR" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalCedula_MR" tabindex="-1" role="dialog" aria-labelledby="ModalCedula_MRlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalCedula_MRlabel">Cédula del Médico Responsable.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileCedula_MR" name="FileCedula_MR[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upCedula_MR" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalDiploma_MR" tabindex="-1" role="dialog" aria-labelledby="ModalDiploma_MRlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalDiploma_MRlabel">Diploma del Médico Responsable.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileDiploma_MR" name="FileDiploma_MR[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upDiploma_MR" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalCurriculum_MR" tabindex="-1" role="dialog" aria-labelledby="ModalCurriculum_MRlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalCurriculum_MRlabel">Curriculum del Médico Responsable.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileCurriculum_MR" name="FileCurriculum_MR[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upCurriculum_MR" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalRelacionPersonalParamedico" tabindex="-1" role="dialog" aria-labelledby="ModalRelacionPersonalParamedicolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalRelacionPersonalParamedicolabel">Relación de Personal Paramédico.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileRelacionPersonalParamedico" name="FileRelacionPersonalParamedico[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upRelacionPersonalParamedico" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalDocumentacion_Laboratorio" tabindex="-1" role="dialog" aria-labelledby="ModalDocumentacion_Laboratoriolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalDocumentacion_Laboratoriolabel">Documentación del Laboratorio.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileDocumentacion_Laboratorio" name="FileDocumentacion_Laboratorio[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upDocumentacion_Laboratorio" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalCopiaLicencia_Matriz" tabindex="-1" role="dialog" aria-labelledby="ModalCopiaLicencia_Matrizlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalCopiaLicencia_Matrizlabel">Copia de Licencia Sanitaria Matriz.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileCopiaLicencia_Matriz" name="FileCopiaLicencia_Matriz[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upCopiaLicencia_Matriz" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalCopiaAutorizacion_Matriz" tabindex="-1" role="dialog" aria-labelledby="ModalCopiaAutorizacion_Matrizlabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalCopiaAutorizacion_Matrizlabel">Copia de Autorización Sanitaria Matriz.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileCopiaAutorizacion_Matriz" name="FileCopiaAutorizacion_Matriz[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upCopiaAutorizacion_Matriz" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalDocumentacion_Tecnico" tabindex="-1" role="dialog" aria-labelledby="ModalDocumentacion_Tecnicolabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalDocumentacion_Tecnicolabel">Documentación del Técnico.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileDocumentacion_Tecnico" name="FileDocumentacion_Tecnico[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upDocumentacion_Tecnico" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalDocumentacion_Responsable" tabindex="-1" role="dialog" aria-labelledby="ModalDocumentacion_Responsablelabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalDocumentacion_Responsablelabel">Documentación del Responsable.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileDocumentacion_Responsable" name="FileDocumentacion_Responsable[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upDocumentacion_Responsable" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalFormaLimpieza" tabindex="-1" role="dialog" aria-labelledby="ModalFormaLimpiezalabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalFormaLimpiezalabel">Forma Limpieza.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="file-loading">
                        <input id="FileFormaLimpieza" name="FileFormaLimpieza[]" class="file-loading" type="file" />
                    </div>
                    <%--<div id="kartik-file-errors"></div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_upFormaLimpieza" class="btn btn-primary" data-dismiss="modal">Subir</button>
                </div>
            </div>
        </div>
    </div>


    <div class="card-block card">
        <div class="card sameheight-item" data-exclude="xs">  <h3 style="text-align:center">Unidad de Evaluación y Autorización Sanitaria</h3>
            <div class="card-header card-header-sm bordered">
                <ul class="nav nav-tabs pull-left" role="tablist" >
                    <li class="nav-item"><a class="nav-link active" href="#Requisitos" role="tab" data-toggle="tab">Requisitos</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#DatosSol" role="tab" data-toggle="tab">Datos del Propietario</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#DatosEst" role="tab" data-toggle="tab">Datos del Establecimiento</a> </li>
                    <li class="nav-item"><a class="nav-link" href="#ResponsableSanitario" role="tab" data-toggle="tab">Datos del Responsable Sanitario</a> </li>


                </ul>
            </div>
        </div>

        <div class="card-block">
            <asp:Label ID="LblMsg" runat="server"></asp:Label>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active fade show" id="Requisitos">


                    <asp:GridView Width="100%"
                        ID="grdNombreTramite"
                        AutoGenerateColumns="false"
                        runat="server" GridLines="None"
                        CssClass="table table-bordered "
                        PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt"
                        OnRowDataBound="grdNombreTramite_RowDataBound"
                        PageSize="7"
                        Style="background: white; text-align: center">

                        <HeaderStyle
                            BackColor="#337ab7"
                            Font-Bold="True"
                            ForeColor="White" />
                        <Columns>

                            <%--<asp:BoundField HeaderText="Riesgo" DataField="riesgo" ItemStyle-Wrap="false" />--%>
                            <asp:BoundField HeaderText="Tipo de Trámite" DataField="nombre_tramite" />
                            <asp:BoundField HeaderText="Modalidad" DataField="modalidad" ItemStyle-Wrap="false" ItemStyle-CssClass="b" ItemStyle-BackColor="#8aff7d" ItemStyle-ForeColor="White" />


                        </Columns>

                    </asp:GridView>

                    <div runat="server" id="fin">

                        <table class="table table-bordered">

                            <tr>
                                <th style="padding: 5px; border-right: hidden; border-top: hidden; border-left: hidden; width:350px">REQUISITO</th>
                                <th style="padding: 5px; text-align: center; border-right: hidden; border-top: hidden; border-left: hidden">ENTREGADO</th>
                            </tr>
                            <tr runat="server" id="uno">
                                <td>
                                    <label>• Solicitud de Licencia Sanitaria</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkSolLicSan" runat="server" Enabled="false" />

                                </td>

                                <td>
                                <a runat="server" id="SolLicSan" data-fancybox="group" class="lightbox">
                                    <div style="display: inline; font-size: initial; width: 10%; padding-top: 8px; padding-left: 5px">Ver Información</div>
                                </a>
                                    
                                </td>
                                <td style="text-align:center">
                                    <!-- Button trigger modal -->
                                    <button runat="server" id="btn_SolLicSan" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalSolLicSan">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                                <td style="border-right: hidden; border-top: hidden; border-bottom: hidden;"></td>

                            </tr>
                            <tr runat="server" id="dosa">
                                <td>
                                    <label>• Alta ante S.A.T.</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkaltasat" runat="server" Enabled="false" /></td>
                                <td><a runat="server" id="Alta" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                </a>

                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_Alta" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalAlta">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="tres">
                                <td>
                                    <label>• Plano y Memoria Descriptiva</label>
                                </td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkPlanoMemoria" runat="server" Enabled="false" /></td>
                                <td><a runat="server" id="PlanoMemoria" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                </a>
                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_PlanoMemoria" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalPlanoMemoria">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="cuatro">
                                <td>
                                    <label>• Relación de Material y Equipo Existente</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkRelacionMaterialEquipo" runat="server" Enabled="false" /></td>
                                <td><a runat="server" id="RelacionMaterialEquipo" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                </a>
                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_RelacionMaterialEquipo" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalRelacionMaterialEquipo">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="cinco">
                                <td>
                                    <label>• Pago</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkPago" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Pago" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_Pago" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalPago">
                                        Seleccionar archivo.
                                    </button>
                                </td>

                            </tr>
                            <tr runat="server" id="seis">
                                <td>
                                    <label>• Programa de Actividades</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkprogramaact" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="ProgramaAct" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_Programaact" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalProgramaact">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="siete">
                                <td>
                                    <label>• Convenio P.G.J.</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkfotocopiaconvenio" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Fotocopiaconvenio" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>

                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_Fotocopiaconvenio" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalFotocopiaconvenio">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="ocho">
                                <td>
                                    <label>• Libro de Registro de Cadáveres</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chklibroregistro" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="LibroRegistro" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>

                                </td>
                                <td style="text-align:center">
                                    <button runat="server" id="btn_LibroRegistro" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalLibroRegistro">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="nueve">
                                <td>
                                    <label>• Descripción de Técnica de Embalsamamiento</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkdescripciontecnicaembal" Enabled="false" runat="server" /></td>
                                <td>
                                    <a runat="server" id="DescripcionTecnica" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>

                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_DescripcionTecnica" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalDescripcionTecnica">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="diez">
                                <td>
                                    <label>• Tarjeta de Control</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chktarjetadecontrol" Enabled="false" runat="server" /></td>
                                <td>
                                    <a runat="server" id="Tarjetadecontrol" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>

                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_Tarjetadecontrol" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalTarjetadecontrol">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="once">
                                <td>
                                    <label>• Carta Consentimiento</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkcartaconsentimiento" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Cartaconsentimiento" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                   <td style="text-align:center">
                                    <button runat="server" id="btn_CartaConsentimiento" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCartaConsentimiento">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="doce">
                                <td>
                                    <label>• Acta Constitutiva</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkactaconstitutiva" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Actaconstitutiva" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                <td style="text-align:center">
                                    <button runat="server" id="btn_ActaConstitutiva" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalActaConstitutiva">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="trece">
                                <td>
                                    <label>• Reglamento Interno</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkreglamentointerno" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Reglamentointerno" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                   
                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_Reglamentointerno" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalReglamentointerno">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="catorce">
                                <td>
                                    <label>• Visto Bueno Protección Civil</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkvistoproteccioncivil" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Vistobueno" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                   
                                </td>
                                  <td style="text-align:center">
                                    <button runat="server" id="btn_Vistobueno" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalVistobueno">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="quince">
                                <td>
                                    <label>• Relación del Personal que labora</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkrelacionpersonal" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Relacionpersonal" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                  <td style="text-align:center">
                                    <button runat="server" id="btn_Relacionpersonal" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalRelacionpersonal">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="dieciseis">
                                <td>
                                    <label>• Autorización del Sistema D.I.F.</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkautorizaciondif" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Autorizaciondif" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                 
                                </td>
                                  <td style="text-align:center">
                                    <button runat="server" id="btn_Autorizaciondif" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalAutorizaciondif">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="diecisiete">
                                <td>
                                    <label>• Cédula de Autoevaluación</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkcedulaautoevaluacion" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Cedulaeval" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                <td style="text-align:center">
                                    <button runat="server" id="btn_CedulaAutoeval" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCedulaAutoeval">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="dieciocho">
                                <td>
                                    <label>• Papel Membretado</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkPapelMembretado" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="PapelMembretado" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                  <td style="text-align:center">
                                    <button runat="server" id="btn_PapelMembretado" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalPapelMembretado">
                                        Seleccionar archivo.
                                    </button>
                                </td>

                            </tr>
                            <tr runat="server" id="diecinueve">
                                <td>
                                    <label>• Autorización S.E.T.</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkautorizacionset" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Autorizacionset" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                               <td style="text-align:center">
                                    <button runat="server" id="btn_Autorizacionset" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalAutorizacionset">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="veinte">
                                <td>
                                    <label>• Uso de Suelo</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkusodesuelo" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Usodesuelo" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_Usodesuelo" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalUsodesuelo">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="veintiuno">
                                <td>
                                    <label>• Proceso de Limpieza</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkprocesolimpieza" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Procesolimpieza" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_ProcesoLimpieza" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalProcesoLimpieza">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="veintidos">
                                <td>
                                    <label>• Relación de Tipo de Análisis</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkrelaciontipoanalisis" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Relaciontipo" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                  <td style="text-align:center">
                                    <button runat="server" id="btn_RelacionTipo" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalRelacionTipo">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="veintitres">
                                <td>
                                    <label>• Acta de Verificación</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkactaverificacion" runat="server" Enabled="false" /></td>
                                 <td style="text-align:center">
                                    <a runat="server" id="Actaverificacion" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                    <asp:FileUpload ID="FileActadeVerificacion" runat="server" CssClass="fileUpload" Style="padding: 4px 4px" />
                                </td>
                            </tr>
                            <tr runat="server" id="veinticuatro">
                                <td>
                                    <label>• Solicitud</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chksolicitud" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Solicitud" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                    <%--<asp:FileUpload ID="FileSolicitud" runat="server" CssClass="fileUpload" Style="padding: 4px 4px" />--%>
                                </td>
                                <td style="text-align:center">
                                    <button runat="server" id="btn_Solicitud" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalSolicitud">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="veinticinco">
                                <td>
                                    <label>• Títutlo</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chktitulo" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Titulo" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_Titulo" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalTitulo">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="veintiseis">
                                <td>
                                    <label>• Cédula</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkcedula" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Cedula" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_Cedula" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCedula">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="veintisiete">
                                <td>
                                    <label>• Diploma</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkdiploma" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Diploma" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                   
                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_Diploma" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalDiploma">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="veintiocho">
                                <td>
                                    <label>• Curriculum</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkCurriculum" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Curriculum" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_Curriculum" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCurriculum">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="veintinueve">
                                <td>
                                    <label>• 2 Fotografías</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkfotografias" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Fotografias" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                   <td style="text-align:center">
                                    <button runat="server" id="btn_Fotografias" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalFotografias">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="treinta">
                                <td>
                                    <label>• Pago del Responsable Sanitario</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkpagoresponsable" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Pagoresponsable" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                  <td style="text-align:center">
                                    <button runat="server" id="btn_Pagoresponsable" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalPagoresponsable">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="treintayuno">
                                <td>
                                    <label>• Aviso de funcionamiento</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkavisofunc" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Avisofunc" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_Avisofunc" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalAvisofunc">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="treintaydos">
                                <td>
                                    <label>• Documentación del técnico en Atención Médica Prehospitalaria</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkdoctecatmedhosp" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="Doctecatmedhosp" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                  <td style="text-align:center">
                                    <button runat="server" id="btn_Doctecatmedhosp" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalDoctecatmedhosp">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="treintaytres" >
                                <td>
                                <label>• Programa Médico</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkprogramamedico" runat="server" Enabled="false" /></td>
                                 <td>
                                    <a runat="server" id="Programamedico" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                   
                                </td>
                                  <td style="text-align:center">
                                    <button runat="server" id="btn_Programamedico" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalProgramamedico">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>

                               <tr runat="server" id="treintaycuatro" >
                                <td>
                                <label>• Características Mecánicas de la Unidad</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkcaracteristicasmecanicas" runat="server" Enabled="false" /></td>
                                 <td>
                                    <a runat="server" id="CaracteristicasMecanicas" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                   
                                </td>
                                 <td style="text-align:center">
                                    <button runat="server" id="btn_CaracteristicasMecanicas" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCaracteristicasMecanicas">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>

                                <tr runat="server" id="treintaycinco" >
                                <td><label>• Fotografías de la Unidad</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkfotografiasdeunidad" runat="server" Enabled="false" /></td><td>
                                    <a runat="server" id="FotografiasdeUnidad" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_FotografiasdeUnidad" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalFotografiasdeUnidad">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="treintayseis" >
                                <td><label>• Licencia Sanitaria Anterior</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chklicenciasanitariaanterior" runat="server" Enabled="false" /></td> <td>
                                    <a runat="server" id="LicSanAnterior" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_LicSanAnterior" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalLicSanAnterior">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                             <tr runat="server" id="treintaysiete" >
                                <td><label>• Autorización de Responsable Anterior</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkautorizacionresponsableanterior" runat="server" Enabled="false" /></td>  <td>
                                    <a runat="server" id="AutorizacionResponsableAnterior" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_AutorizacionResponsableAnterior" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalAutorizacionResponsableAnterior">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                             <tr runat="server" id="treintayocho" >
                                <td><label>• Carta de Antecedentes no penales</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkantecedentesnopenales" runat="server" Enabled="false" /></td><td>
                                    <a runat="server" id="AntecedentesNoPenales" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_AntecedentesNoPenales" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalAntecedentesNoPenales">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                             <tr runat="server" id="treintaynueve" >
                                <td><label>• Póliza de seguro ante eventualidades</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkpolizaseguro" runat="server" Enabled="false" /></td><td>
                                    <a runat="server" id="PolizaSeguro" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_PolizaSeguro" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalPolizaSeguro">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                             <tr runat="server" id="cuarenta" >
                                <td><label>• Programación de la alimentación de la semana y documentación profesional del nutriólogo</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkprogramaalimentacion" runat="server" Enabled="false" /></td><td>
                                    <a runat="server" id="ProgramaAlimentacion" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_ProgramaAlimentacion" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalProgramaAlimentacion">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                              <tr runat="server" id="cuarentayuno" >
                                <td><label>• Título del médico responsable</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chktitulo_mr" runat="server" Enabled="false" /></td><td>
                                    <a runat="server" id="Titulo_MR" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_Titulo_MR" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalTitulo_MR">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="cuarentaydos" >
                                <td><label>• Cédula del médico responsable</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkcedula_mr" runat="server" Enabled="false" /></td><td>
                                    <a runat="server" id="Cedula_MR" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_Cedula_MR" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCedula_MR">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                             <tr runat="server" id="cuarentaytres" >
                                <td><label>• Diploma del médico responsable</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkdiploma_mr" runat="server" Enabled="false" /></td><td>
                                    <a runat="server" id="Diploma_MR" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_Diploma_MR" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalDiploma_MR">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="cuarentaycuatro" >
                                <td><label>• Curriculum del médico responsable</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkcurriculum_mr" runat="server" Enabled="false" /></td><td>
                                    <a runat="server" id="Curriculum_MR" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_Curriculum_MR" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCurriculum_MR">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                             <tr runat="server" id="cuarentaycinco" >
                                <td><label>• Relación de personal paramédico</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkrelacionpersonal_paramedico" runat="server" Enabled="false" /></td><td>
                                    <a runat="server" id="RelacionPersonalParamedico" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_RelacionPersonalParamedico" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalRelacionPersonalParamedico">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                                 <tr runat="server" id="cuarentayseis" >
                                <td><label>• Documentación para el trámite de laboratorio</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkdocumentacion_laboratorio" runat="server" Enabled="false" /></td><td>
                                    <a runat="server" id="Documentacion_Laboratorio" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_Documentacion_Laboratorio" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalDocumentacion_Laboratorio">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                               <tr runat="server" id="cuarentaysiete" >
                                <td><label>• Copia de la licencia sanitaria del laboratorio matriz</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkcopialicencia_matriz" runat="server" Enabled="false" /></td><td>
                                    <a runat="server" id="CopiaLicencia_Matriz" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_CopiaLicencia_Matriz" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCopiaLicencia_Matriz">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                              <tr runat="server" id="cuarentayocho" >
                                <td><label>• Copia de la autorización de responsable del laboratorio matriz</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkcopiaautorizacion_matriz" runat="server" Enabled="false" /></td><td>
                                    <a runat="server" id="CopiaAutorizacion_Matriz" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_CopiaAutorizacion_Matriz" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCopiaAutorizacion_Matriz">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                             <tr runat="server" id="cuarentaynueve" >
                                <td><label>• Documentación profesional del técnico en el área</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkdocumentacion_tecnico" runat="server" Enabled="false" /></td><td>
                                    <a runat="server" id="Documentacion_Tecnico" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_Documentacion_Tecnico" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalDocumentacion_Tecnico">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="cincuenta" >
                                <td><label>• Documentación que acredite al responsable</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkdocumentacion_responsable" runat="server" Enabled="false" /></td><td>
                                    <a runat="server" id="Documentacion_Responsable" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_Documentacion_Responsable" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalDocumentacion_Responsable">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                            <tr runat="server" id="cincuentayuno" >
                                <td><label>• Forma de limpieza y esterilización</label></td>
                                <td style="text-align: center"><asp:CheckBox ID="chkformalimpieza" runat="server" Enabled="false" /></td><td>
                                    <a runat="server" id="FormaLimpieza" data-fancybox="group" class="lightbox">
                                    <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div></a></td> <td style="text-align:center">
                                    <button runat="server" id="btn_FormaLimpieza" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalFormaLimpieza">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>

                               <tr runat="server" id="dictamenjj">
                                <td><a>• </a>
                                    <label>Evaluación Documental.</label></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="chkDictamenDocumental" runat="server" Enabled="false" /></td>
                                <td>
                                    <a runat="server" id="DictamenDocumental" data-fancybox="group" class="lightbox">
                                        <div style="font-size: initial; padding-top: 8px; display: inline; padding-left: 5px">Ver Información</div>
                                    </a>
                                </td>
                                   <td style="text-align:center">
                                    <button runat="server" id="btn_DictamenDocumental" type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalDictamenDocumental">
                                        Seleccionar archivo.
                                    </button>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table id="verifica" runat="server">

                            <tr>
                                <th style="padding: 5px; border-right: hidden; border-top: dotted; border-left: dotted">¿Necesita Verificación y Dictamen Jurisdiccional?</th>
                                <th style="padding: 20px; text-align: center; border-right: dotted; border-top: dotted; border-left: hidden"></th>
                            </tr>
                            <tr runat="server" id="VerificacionBajo" style="text-align: center; border-right: dotted; border-left: dotted; border-bottom: dotted;">
                                <td style="text-align:center; border-top:hidden">
                                    <label><a runat="server" id="sino"></a></label>
                                </td>
                                <td style="text-align: center; border-left:hidden; border-top:hidden">
                                    <asp:CheckBox ID="chkVerificacion" onclick="myFunction()" runat="server" />

                                </td>

                            </tr>
                        </table>



                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade in" id="DatosSol">


              
                        <div class="row">
                            <div class="col-sm-12">

                                <h3 style="font-weight: bold">Datos del Propietario:</h3>
                                <div class="form-group col-sm-12">

                                    <div class="row">
                                         <div>
                                    <label>
                                        CURP:<br />
                                        <asp:TextBox Width="235px" ID="txtCurp"  class="form-control b" Style="text-transform: uppercase;"
                                            runat="server" oninput="validarInput(this)" onclick="validarInput(this)"
                                            onkeypress="return curpValida(event)"
                                            MaxLength="18" MinLength="18" autocomplete="true" disabled="true"></asp:TextBox>

                                        <p id="resultado"></p>
                               

                                    </label></div>
                                      <div class="offset-sm-1">





                                                <%--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--%>

                                                <label>
                                                    RFC:<br />
                                                    <asp:TextBox ID="txtRFCprop" class="form-control b" Style="text-transform: uppercase; "
                                                        runat="server" oninput="validarInput4(this)" onclick="validarInput4(this)"
                                                        onkeypress="return rfcValido4(event)"
                                                        MaxLength="14" MinLength="13" autocomplete="true" disabled="true"> </asp:TextBox>
                                                     <p id="resultado4"></p>
                                                </label>
                                               
                                            </div>
                                        </div>
                                    <div class="row">

                                        <div class="col-sm-6 ">
                                            Nombre(s):
                                <asp:TextBox ID="txtNombre" TextMode="MultiLine" Rows="1" class="form-control css-input"
                                    runat="server" onkeypress="return sololetras(event)"
                                    Style="text-transform: uppercase;" disabled="true"></asp:TextBox>
                                   <br />       
                                        </div>
                                    </div>
                                    <div style="width: 100%" class="row">
                                        <div class="col-sm-3">
                                            Telefono Movil:
                              <asp:TextBox Width="120px" ID="txtTelmov" MaxLength="10" MinLength="10" class="form-control css-input" runat="server"
                                  onkeypress="return numbersonly(event)" autocomplete="" disabled="true"></asp:TextBox>
                                     
                                        </div>

                                        <div class="col-sm-3">
                                            Telefono Fijo:   (Opcional) 
                                <asp:TextBox Width="120px" ID="txtTelfij" SetFocusOnError="true" MaxLength="10" MinLength="10" class="form-control css-input" runat="server" onkeypress="return numbersonly(event)" autocomplete="" disabled="true"></asp:TextBox>
                                       
                                      
                                        </div>
                                    </div>
                                    <br />

                                    <div style="width: 100%" class="row">


                                        <div class="col-sm-5">
                                            <label>
                                                Correo Electronico:<br />
                                                <asp:TextBox ID="txtCorreo" Width="235px" class="form-control b"
                                                    autocomplete="off" onkeyup="validarEmail(this)" onclick="validarEmail(this)"
                                                    runat="server" disabled="true"></asp:TextBox>

                                                <p id="resultadoz"></p>
                                        
                                            </label>
                                            <br />
                                        </div>
                                    </div>
                                    <br />
                                </div>
                            </div>
                        </div>
                    
                    
                    </div>
                <div role="tabpanel" class="tab-pane fade in" id="DatosEst">

                        <div class="row">
                            <div class="row col-sm-6">
                                <div>


                                    <h3 style="font-weight: bold">Datos del Establecimiento:</h3>


                                    <div class="form-group">

                                        <div class="row">
                                            <div class="col-sm-8">
                                                <%--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--%>

                                                <label>
                                                    RFC:<br />
                                                    <asp:TextBox ID="txtRfc" class="form-control" Style="text-transform: uppercase; width:80%"
                                                        runat="server" oninput="validarInput2(this)" onclick="validarInput2(this)"
                                                        onkeypress="return rfcValido2(event)"
                                                        MaxLength="14" MinLength="13" autocomplete="true" disabled="true"> </asp:TextBox>
                                                </label>
                                                <p id="resultado2"></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-11">
                                                Nombre del Establecimiento: 
                                <asp:TextBox TextMode="multiline" Rows="3" ID="txtNombreest" Style="text-transform: uppercase;" class="css-input form-control " runat="server" disabled="true"></asp:TextBox>
                                               
                                                <br />
                                                Denominación de giro:<br />
                                                <asp:TextBox TextMode="multiline" rows="3" ID="txtRazonsocial" Style="text-transform: uppercase;" class="form-control css-input" runat="server" disabled="true"></asp:TextBox>

                                                <br />
                                            </div>
                                        </div>
                                    </div>

                                    <div>
                                    </div>
                                </div>
                            </div>

                            <div class="row col-sm-6">
                                <label>Domicilio:</label>
                                <br />


                                Municipio:<br />
                                <asp:TextBox ID="txtMunicipio" Style="text-transform: uppercase;" class="form-control css-input" runat="server" disabled="true"></asp:TextBox>
                               


                                Localidad:<br />
                                <asp:TextBox ID="txtLocalidad" Style="text-transform: uppercase;" class="form-control css-input" runat="server" disabled="true"></asp:TextBox>
                              

                           





                                <div class="row">
                                    <div class="col-sm-9">
                                        Colonia:<br />
                                        <asp:TextBox TextMode="MultiLine" Rows="2" ID="txtColonia" Style="text-transform: uppercase;" class="form-control css-input" runat="server" disabled="true"></asp:TextBox>


                                    </div>

                                    <div class="col-sm-3">
                                        C.P.:
                                                <br />
                                        <asp:TextBox ID="txtCP" MaxLength="5" MinLength="5" class="form-control css-input" runat="server" onkeypress="return numbersonly(event)" autocomplete="" disabled="true"></asp:TextBox>
                                 
                                    </div>
                                </div>

                                <div class="row">
                                     <div class="col-sm-12">
                                        Calle:<br />
                                        <asp:TextBox TextMode="MultiLine" Rows="1" ID="txtCalle" Style="text-transform: uppercase;" class="form-control css-input" runat="server" disabled="true"></asp:TextBox>
                                         </div>
                                    <div class=" col-sm-12">

                                     
                                         Número interior/exterior, manzana y lote:<br />
                                          <asp:TextBox ID="txtNumero" TextMode="MultiLine" Rows="2" Style="text-transform: uppercase;"  class="form-control css-input" runat="server" disabled="true"></asp:TextBox>
                                       
                                        </div>
                                    <div class="col-sm-12">
                                            Referencias:<br />
                                        <asp:TextBox ID="txtReferencias" TextMode="MultiLine" Rows="2" Style="text-transform: uppercase;" class="form-control css-input" runat="server" disabled="true"></asp:TextBox>

                                    </div>
                                </div>

                                <div class="row">
                                    <label>Información de Contacto:</label>

                                    <br />

                                    <div class="col-sm-8">
                                        <label>
                                            Correo Electrónico del Establecimiento<br />
                                            <asp:TextBox ID="txtCorreoest" Width="235px" class="form-control b"
                                                autocomplete="off" onkeyup="validarEmail2(this)" onclick="validarEmail2(this)"
                                                runat="server"  disabled="true"></asp:TextBox>

                                            <p id="resultadoz2"></p>

                                        </label>

                                    </div>

                                    <div class="col-sm-3">
                                        Telefono:
                              <asp:TextBox Width="120px" ID="txtTelest" MaxLength="10" MinLength="10" class="form-control css-input" runat="server" onkeypress="return numbersonly(event)" autocomplete="" disabled="true"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                                                       
                        </div>


                             <label>Horario:</label><br />
                                                
                                            <table>
                                                <tr style="text-align:center">
                                                    <th style="padding: 10px">Días:</th>
                                                    <th style="padding: 10px; border-left:hidden;"></th>
                                                    <th colspan="2" style="text-align:center">Horario 1:</th>
                                                    <th colspan="2" style="text-align:center">Horario 2:</th>
                                                </tr>
                                                <tr>
                                                    <td style="border-right:hidden  ">Lunes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkLunesEst" runat="server" /></td>
                                                    <td><input id="LunesH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="LunesH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="LunesH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="LunesH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                  
                                                </tr>
                                                <tr>
                                                    <td style="border-right:hidden  ">Martes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkMartesEst" runat="server" /></td>
                                                    <td><input id="MartesH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="MartesH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="MartesH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="MartesH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                     
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Miércoles:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkMiercolesEst" runat="server" /></td>
                                                    <td><input id="MiercolesH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="MiercolesH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="MiercolesH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="MiercolesH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                 
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Jueves:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkJuevesEst" runat="server" /></td>
                                                    <td><input id="JuevesH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="JuevesH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="JuevesH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="JuevesH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                   

                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Viernes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkViernesEst" runat="server" /></td>
                                                    <td><input id="ViernesH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="ViernesH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="ViernesH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="ViernesH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                   
                                                </tr>
                                                 <tr>
                                                    <td style="border-right:hidden  ">Sábado:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkSabadoEst" runat="server" /></td>
                                                    <td><input id="SabadoH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="SabadoH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="SabadoH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="SabadoH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                 
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Domingo:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkDomingoEst" runat="server" /></td>
                                                    <td><input id="DomingoH1inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="DomingoH1fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="DomingoH2inicio" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="DomingoH2fin" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled" /></td>
                                                </tr>
                                            </table>

                    </div>
                <div role="tabpanel" class="tab-pane fade in" id="ResponsableSanitario">


                        <div class="row">
                            <div class="col-sm-12">

                                <h3 style="font-weight: bold">Datos del Responsable Sanitario:</h3>
                                <div class="form-group col-sm-12">



                                    <div class="row">

                                        <div class="col-sm-6 ">
                                            Nombre(s):
                                <asp:TextBox ID="txtRnombre" class="form-control css-input"
                                    runat="server" onkeypress="return sololetras(event)"
                                    Style="text-transform: uppercase;" disabled="true"></asp:TextBox>
                                            
                                            
                                        </div>
                                      
                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            Grado Académico que Ostenta:
                                              <asp:TextBox ID="txtRgrado" class="form-control css-input" runat="server"
                                                  Style="text-transform: uppercase;" disabled="true"></asp:TextBox>
                                          
                                        </div>

                           <%--   <div class="select" style="text-align:center">
                                    <asp:DropDownList Width="15%" ID="DropDownList1"
                                        OnSelectedIndexChanged="Selection_Change"
                                        EnableViewState="true"
                                        runat="server">
                                        <asp:ListItem Selected="True" Value="Profesional">Profesional</asp:ListItem>
                                        <asp:ListItem Value="Provisional">Provisional</asp:ListItem>
                                    </asp:DropDownList>
                                </div>--%>
                                        <div class="col-sm-5">
                                             <%--   <a id="Provisional" runat="server" onclick="onclock()">Número de Cédula Profesional</a>--%>
                                         
                                           Número de Cédula Profesional o Provisional
                                              <asp:TextBox ID="txtRcedula" class="form-control css-input" Width="80%"
                                                  runat="server"
                                                  Style="text-transform: uppercase;" disabled="true"></asp:TextBox>
                                          
                                        </div>


                                    </div>
                                      <label>
                                                    RFC:<br />
                                                    <asp:TextBox ID="txtRfcR" class="form-control" Style="text-transform: uppercase;"
                                                        runat="server" oninput="validarInput3(this)" onclick="validarInput3(this)"
                                                        onkeypress="return rfcValido3(event)"
                                                        MaxLength="14" MinLength="13" autocomplete="true" disabled="true"> </asp:TextBox>
                                               
                                          <p id="resultado3"></p>
                                             <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                    ControlToValidate="txtRfcR"
                                                    ErrorMessage="Se necesita del RFC."
                                                    ForeColor="Red">
                                                </asp:RequiredFieldValidator>--%>
                                     </label>
                                    <div class="row">


                                        <div class="col-sm-5">
                                          
                             <label>Horario:</label><br />
                                                
                                            <table>
                                                <tr style="text-align:center">
                                                    <th style="padding: 10px">Días:</th>
                                                    <th style="padding: 10px; border-left:hidden;"></th>
                                                    <th colspan="2" style="text-align:center">Horario 1:</th>
                                                    <th colspan="2" style="text-align:center">Horario 2:</th>
                                                </tr>
                                                <tr>
                                                    <td style="border-right:hidden  ">Lunes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkLunesR" runat="server" /></td>
                                                    <td><input id="LunesH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="LunesH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="LunesH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="LunesH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                 
                                                </tr>
                                                <tr>
                                                    <td style="border-right:hidden  ">Martes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkMartesR" runat="server" /></td>
                                                    <td><input id="MartesH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled"/></td>
                                                    <td><input id="MartesH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="MartesH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="MartesH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Miércoles:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkMiercolesR" runat="server" /></td>
                                                    <td><input id="MiercolesH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="MiercolesH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="MiercolesH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="MiercolesH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                   
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Jueves:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkJuevesR" runat="server" /></td>
                                                    <td><input id="JuevesH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="JuevesH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled"/></td>
                                                    <td><input id="JuevesH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="JuevesH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                       

                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Viernes:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkViernesR" runat="server" /></td>
                                                    <td><input id="ViernesH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="ViernesH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="ViernesH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="ViernesH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                   
                                                </tr>
                                                 <tr>
                                                    <td style="border-right:hidden  ">Sábado:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkSabadoR" runat="server" /></td>
                                                    <td><input id="SabadoH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="SabadoH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="SabadoH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="SabadoH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    
                                                </tr>
                                                  <tr>
                                                    <td style="border-right:hidden  ">Domingo:</td>
                                                    <td style="text-align: center">
                                                    <asp:CheckBox ID="chkDomingoR" runat="server" /></td>
                                                    <td><input id="DomingoH1inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)"  disabled="disabled"/></td>
                                                    <td><input id="DomingoH1finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="DomingoH2inicioR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                    <td><input id="DomingoH2finR" runat="server" autopostback="true" type="text" class="timepicker timepickerHour" onkeypress="return numbersonly(event)" disabled="disabled" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>



        </div>
        <div runat="server" id="AcAp">
            <h2>
                <label style="text-align: center">Acuse:</label></h2>
            <br />
            <table>
                <tr>
                    <th class="fr" style="text-align: center; padding: 5px; border-right: hidden; border-top: hidden; border-left: hidden"></th>
                    <th class="sr" style="padding: 5px; text-align: center; border-right: hidden; border-top: hidden; border-left: hidden"></th>
                </tr>
                <tr runat="server">
                    <td><a>• </a>
                        <label runat="server" id="lblacuse">Acuse</label></td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chkAcuse" runat="server" Enabled="false" />

                    </td>
                    <td><a runat="server" id="Acuse" data-fancybox="group" class="lightbox">
                        <div style="display: inline; font-size: initial; width: 10%; padding-top: 8px; padding-left: 5px"></div>
                    </a>


                        <asp:FileUpload ID="fileAcuse" runat="server" CssClass="fileUpload" Style="padding: 4px 4px" />

                    </td>

                </tr>

            </table>


        </div>



        <br />
        <div style="text-align: center">


            <div class="btn-group div1" style="margin-right: 10%; margin-left: 10%">
                <asp:Button ID="btnPrevision"
                    OnClick="btnPrevision_Click"
                    runat="server" class="myButton"
                    Text="Prevención" />

                <asp:Literal ID="Literal4" runat="server"></asp:Literal>
            </div>
            <div class="btn-group div1" style="margin-right: 10%;">
                <asp:Button ID="btnAprobado"
                    OnClick="btnAprobado_Click"
                    runat="server" class="myButtonAprobar"
                    Text="Aprobar" />
                <asp:Literal ID="Literal2" runat="server"></asp:Literal>

            </div>
            <div class="btn-group div1">
                <asp:Button ID="btnRechazado"
                    OnClick="btnRechazado_Click"
                    runat="server" class="myButtonRechazar"
                    OnClientClick="return GetUserValue();" 
                    Text="Rechazar" />
                <asp:Literal ID="Literal3" runat="server"></asp:Literal>
            </div>

        </div>

    </div>

    <%--<asp:TextBox ID="check" runat="server"></asp:TextBox>--%>

        </div>
    <p style="visibility: hidden">

        <asp:TextBox ID="cis" runat="server" />
        <asp:TextBox ID="ueas" runat="server" />
        <asp:TextBox ID="coor" runat="server" />
        <asp:TextBox ID="uos" runat="server" />
        <asp:TextBox ID="dictaminador" runat="server" />
        <asp:TextBox ID="dos" runat="server" />
        <asp:TextBox ID="dds" runat="server" />
        <asp:TextBox ID="deas" runat="server" />
        <asp:TextBox ID="das" runat="server" />
        <asp:TextBox ID="corr" runat="server" />
        <asp:TextBox ID="rech" runat="server" />
        <asp:TextBox ID="entr" runat="server" />
        <asp:TextBox ID="folio" runat="server"></asp:TextBox>
        <asp:TextBox ID="riesgo" runat="server"></asp:TextBox>
        <asp:TextBox ID="verificacion" runat="server"></asp:TextBox>
        <asp:TextBox ID="modalidad" runat="server"></asp:TextBox>
        <asp:TextBox ID="id_tramite" runat="server"></asp:TextBox>
        <asp:TextBox ID="statos" runat="server"></asp:TextBox>
        <asp:TextBox ID="certificado_anterior" runat="server"></asp:TextBox>


        <asp:TextBox ID="txtsol" runat="server"></asp:TextBox>
        <asp:TextBox ID="txttit" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtced" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtdip" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtcurr" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtprog" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtrel" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtplano" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtalt" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtpapel" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtform" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtcop" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtlic" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtdicdoc" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtrechazo" runat="server"></asp:TextBox>

        <asp:TextBox ID="txtprogramaact" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtfotocopia" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtlibroregistro" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtdescripciontecnica" runat="server"></asp:TextBox>
        <asp:TextBox ID="txttarjetadecontrol" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtcartaconsentimiento" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtactaconstitutiva" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtreglamentointerno" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtvistobueno" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtrelacionpersonal" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtautorizaciondif" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtcedulaautoeval" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtautorizacionset" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtusodesuelo" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtprocesolimpieza" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtrelaciontipo" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtactaverificacion" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtsolicitud" runat="server"></asp:TextBox>
        <asp:TextBox ID="txttitulo" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtcedula" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtdiploma" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtfotografias" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtpagoresponsable" runat="server"></asp:TextBox>









    </p>

    <%--  <button type="button" id="bnt_upSolLicSan" class="btn btn-primary" data-dismiss="modal">Subir</button>--%>
    <asp:Literal ID="LblMensaje" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="Server">
    <script type="text/javascript">
        var map;
        var creator;
        //var polygonArray;
        var id_folio = <%=Request.Params["id"]%>;

        Sys.Application.add_load(function () {
            $(window).on('load', function () {
                var varIP = [];
                var varIPC = [];
                //$.ajax({
                //    type: 'POST',
                //    url: "UEAS.aspx/InitialPreview",
                //    data: JSON.stringify({ folio: id_folio }),
                //    dataType: "json",
                //    contentType: 'application/json; charset=utf-8',
                //    async: false,
                //    success: function (result) {
                //        datos = JSON.parse(result.d);
                //        varIP = datos.InitialPreview;
                //        varIPC = datos.InitialPreviewConfig;
                //    }
                //});

                $("#FileSolLicSan").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=SolLicSan", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id="+id_folio+""; });
                $("#FileAlta").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=AltaSAT", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FilePlanoMemoria").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=PlanoMemoria", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileRelacionMaterialEquipo").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=RelacionMaterialEquipo", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FilePago").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=Pago", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileProgramaact").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=ProgramadeActividades", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileFotocopiaconvenio").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=FotocopiaConvenio", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileLibroRegistro").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=LibroRegistro", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileDescripcionTecnica").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=TecnicaEmbalsamamiento", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileTarjetadecontrol").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=TarjetadeControl", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileCartaConsentimiento").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=CartaConsentimiento", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileActaConstitutiva").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=ActaConstitutiva", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileReglamentointerno").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=ReglamentoInterno", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileVistobueno").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=ProteccionCivil", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileRelacionpersonal").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=RelacionPersonal", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileAutorizaciondif").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=AutorizaciónDIF", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileCedulaAutoeval").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=CedulaAutoevaluación", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FilePapelMembretado").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=PapelMembretado", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileAutorizacionset").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=AutorizaciónSET", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileUsodesuelo").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=UsoDeSuelo", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileProcesoLimpieza").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=ProcesoLimpieza", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileRelacionTipo").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=RelaciónTipoAnálisis", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileSolicitud").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=Solicitud", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileTitulo").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=Titulo", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileCedula").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=Cedula", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileDiploma").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=Diploma", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileCurriculum").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=Curriculum", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileFotografias").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=Fotografias", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FilePagoresponsable").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=PagoDelResponsable", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});
                $("#FileAvisofunc").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=AvisodeFunc", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + "";});

                $("#FileDoctecatmedhosp").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=DocTecatmedhosp", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileProgramamedico").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=ProgramaMedico", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileCaracteristicasMecanicas").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=CaracteristicasMecanicas", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileFotografiasdeUnidad").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=FotografiasdeUnidad", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileLicSanAnterior").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=LicSanAnterior", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileAutorizacionResponsableAnterior").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=AutorizacionResponsableAnterior", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileAntecedentesNoPenales").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=AntecedentesNoPenales", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FilePolizaSeguro").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=PolizaSeguro", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileProgramaAlimentacion").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=ProgramaAlimentacion", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileTitulo_MR").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=Titulo_MR", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileCedula_MR").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=Cedula_MR", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileDiploma_MR").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=Diploma_MR", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileCurriculum_MR").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=Curriculum_MR", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileRelacionPersonalParamedico").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=RelacionPersonalParamedico", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileDocumentacion_Laboratorio").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=Documentacion_Laboratorio", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileCopiaLicencia_Matriz").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=CopiaLicencia_Matriz", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileCopiaAutorizacion_Matriz").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=CopiaAutorizacion_Matriz", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileDocumentacion_Tecnico").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=Documentacion_Tecnico", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileDocumentacion_Responsable").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=Documentacion_Responsable", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
                $("#FileFormaLimpieza").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=FormaLimpieza", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });


                $("#FileDictamenDocumental").fileinput({

                    theme: "fas",
                    browseClass: "btn btn-primary",
                    browseLabel: "Buscar.",
                    //browseIcon: "<i class=\"fa fa-folder-open\"></i> ",
                    //removeClass: "btn btn-danger",
                    //removeLabel: "",
                    //removeIcon: "<i class=\"fa fa-trash\"></i> ",
                    //uploadClass: "btn btn-success",
                    //uploadLabel: "",
                    //uploadIcon: "<i class=\"fa fa-upload\"></i> ",
                    fileType: "any",
                    language: "es",
                    uploadUrl: "~/../comun/archivo-subir.aspx?tipo=BitacoraDeSeguimiento&nombrearchivo=DicDocumental", // server upload action
                    uploadAsync: false,
                    showClose: false,
                    //minFileCount: 1,
                    //maxFileCount: 1,
                    showRemove: false,
                    showUpload: false,
                    uploadExtraData: {
                        id: id_folio,
                        sessionId: 0
                    },
                    initialPreviewFileType: 'image',
                    initialPreviewAsData: true,
                    overwriteInitial: false,
                    initialPreview: varIP,
                    initialPreviewConfig: varIPC,
                    allowedPreviewTypes: ["image", "text", "pdf"],
                    'previewFileType': 'any'
                }).on('filebatchuploadsuccess', function (event, data) { alert('Información Subida con Éxito'); window.location = "ueas.aspx?id=" + id_folio + ""; });
            }); 
            $("#btn_upSolLicSan").click(function () {$("#FileSolLicSan").fileinput("upload");});
            $("#btn_upAlta").click(function () {$("#FileAlta").fileinput("upload");});
            $("#btn_upPlanoMemoria").click(function () {$("#FilePlanoMemoria").fileinput("upload");});
            $("#btn_upRelacionMaterialEquipo").click(function () {$("#FileRelacionMaterialEquipo").fileinput("upload");});
            $("#btn_upPago").click(function () {$("#FilePago").fileinput("upload");});
            $("#btn_upProgramaact").click(function () {$("#FileProgramaact").fileinput("upload");});
            $("#btn_upFotocopiaconvenio").click(function () {$("#FileFotocopiaconvenio").fileinput("upload");});
            $("#btn_upLibroRegistro").click(function () {$("#FileLibroRegistro").fileinput("upload");});
            $("#btn_upDescripcionTecnica").click(function () {$("#FileDescripcionTecnica").fileinput("upload");});
            $("#btn_upTarjetadecontrol").click(function () {$("#FileTarjetadecontrol").fileinput("upload");});
            $("#btn_upCartaConsentimiento").click(function () { $("#FileCartaConsentimiento").fileinput("upload");});
            $("#btn_upActaConstitutiva").click(function () { $("#FileActaConstitutiva").fileinput("upload"); });
            $("#btn_upReglamentointerno").click(function () { $("#FileReglamentointerno").fileinput("upload"); });
            $("#btn_upVistobueno").click(function () { $("#FileVistobueno").fileinput("upload"); });
            $("#btn_upRelacionpersonal").click(function () { $("#FileRelacionpersonal").fileinput("upload"); });
            $("#btn_upAutorizaciondif").click(function () { $("#FileAutorizaciondif").fileinput("upload"); });
            $("#btn_upCedulaAutoeval").click(function () { $("#FileCedulaAutoeval").fileinput("upload"); });
            $("#btn_upPapelMembretado").click(function () { $("#FilePapelMembretado").fileinput("upload"); });
            $("#btn_upAutorizacionset").click(function () { $("#FileAutorizacionset").fileinput("upload"); });
            $("#btn_upUsodesuelo").click(function () { $("#FileUsodesuelo").fileinput("upload"); });
            $("#btn_upProcesoLimpieza").click(function () { $("#FileProcesoLimpieza").fileinput("upload"); });
            $("#btn_upRelacionTipo").click(function () { $("#FileRelacionTipo").fileinput("upload"); });
            $("#btn_upSolicitud").click(function () { $("#FileSolicitud").fileinput("upload"); });
            $("#btn_upTitulo").click(function () { $("#FileTitulo").fileinput("upload"); });
            $("#btn_upCedula").click(function () { $("#FileCedula").fileinput("upload"); });
            $("#btn_upDiploma").click(function () { $("#FileDiploma").fileinput("upload"); });
            $("#btn_upCurriculum").click(function () { $("#FileCurriculum").fileinput("upload"); });
            $("#btn_upFotografias").click(function () { $("#FileFotografias").fileinput("upload"); });
            $("#btn_upPagoresponsable").click(function () { $("#FilePagoresponsable").fileinput("upload"); });
            $("#btn_upAvisofunc").click(function () { $("#FileAvisofunc").fileinput("upload"); });

            $("#btn_upDoctecatmedhosp").click(function () { $("#FileDoctecatmedhosp").fileinput("upload"); });
            $("#btn_upProgramamedico").click(function () { $("#FileProgramamedico").fileinput("upload"); });
            $("#btn_upCaracteristicasMecanicas").click(function () { $("#FileCaracteristicasMecanicas").fileinput("upload"); });
            $("#btn_upFotografiasdeUnidad").click(function () { $("#FileFotografiasdeUnidad").fileinput("upload"); });
            $("#btn_upLicSanAnterior").click(function () { $("#FileLicSanAnterior").fileinput("upload"); });
            $("#btn_upAutorizacionResponsableAnterior").click(function () { $("#FileAutorizacionResponsableAnterior").fileinput("upload"); });
            $("#btn_upAntecedentesNoPenales").click(function () { $("#FileAntecedentesNoPenales").fileinput("upload"); });
            $("#btn_upPolizaSeguro").click(function () { $("#FilePolizaSeguro").fileinput("upload"); });
            $("#btn_upProgramaAlimentacion").click(function () { $("#FileProgramaAlimentacion").fileinput("upload"); });
            $("#btn_upTitulo_MR").click(function () { $("#FileTitulo_MR").fileinput("upload"); });
            $("#btn_upCedula_MR").click(function () { $("#FileCedula_MR").fileinput("upload"); });
            $("#btn_upDiploma_MR").click(function () { $("#FileDiploma_MR").fileinput("upload"); });
            $("#btn_upCurriculum_MR").click(function () { $("#FileCurriculum_MR").fileinput("upload"); });
            $("#btn_upRelacionPersonalParamedico").click(function () { $("#FileRelacionPersonalParamedico").fileinput("upload"); });
            $("#btn_upDocumentacion_Laboratorio").click(function () { $("#FileDocumentacion_Laboratorio").fileinput("upload"); });
            $("#btn_upCopiaLicencia_Matriz").click(function () { $("#FileCopiaLicencia_Matriz").fileinput("upload"); });
            $("#btn_upCopiaAutorizacion_Matriz").click(function () { $("#FileCopiaAutorizacion_Matriz").fileinput("upload"); });
            $("#btn_upDocumentacion_Tecnico").click(function () { $("#FileDocumentacion_Tecnico").fileinput("upload"); });
            $("#btn_upDocumentacion_Responsable").click(function () { $("#FileDocumentacion_Responsable").fileinput("upload"); });
            $("#btn_upFormaLimpieza").click(function () { $("#FileFormaLimpieza").fileinput("upload"); });

                

            $("#btn_upDictamenDocumental").click(function () { $("#FileDictamenDocumental").fileinput("upload"); });
        });




    </script>
    <script src='https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.6/dist/jquery.fancybox.min.js'></script>
    <script>(function ($) { $(document).ready(function () { $('.lightbox').fancybox }); })(jQuery)</script>
    <%--<script src="https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js"></script>--%>

    <%--  <script>
        $(document).on('ready', function () {
            $("#file-0b").fileinput();
        });
    </script>--%>



    <%-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--%>

    <%--    <script>
        $('#file-fr').fileinput({
            theme: 'fas',
            language: 'fr',
            uploadUrl: '#',
            allowedFileExtensions: ['jpg', 'png', 'gif']
        });
        $('#FileSolLicSan').fileinput({
            theme: 'fas',
            language: 'es',
            uploadUrl: '#'
            //allowedFileExtensions: ['jpg', 'png', 'gif']
        });
        $("#file-0").fileinput({
            theme: 'fas',
            'allowedFileExtensions': ['jpg', 'png', 'gif']
        });
        $("#file-1").fileinput({
            theme: 'fas',
            uploadUrl: '#', // you must set a valid URL here else you will get an error
            allowedFileExtensions: ['jpg', 'png', 'gif'],
            overwriteInitial: false,
            maxFileSize: 1000,
            maxFilesNum: 10,
            //allowedFileTypes: ['image', 'video', 'flash'],
            slugCallback: function (filename) {
                return filename.replace('(', '_').replace(']', '_');
            }
        });
        /*
         $(".file").on('fileselect', function(event, n, l) {
         alert('File Selected. Name: ' + l + ', Num: ' + n);
         });
         */
        $("#file-3").fileinput({
            theme: 'fas',
            showUpload: false,
            showCaption: false,
            browseClass: "btn btn-primary btn-lg",
            fileType: "any",
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            overwriteInitial: false,
            initialPreviewAsData: true,
            initialPreview: [
                //"http://lorempixel.com/1920/1080/transport/1",
                //"http://lorempixel.com/1920/1080/transport/2",
                //"http://lorempixel.com/1920/1080/transport/3"
            ],
            initialPreviewConfig: [
                { caption: "transport-1.jpg", size: 329892, width: "120px", url: "{$url}", key: 1 },
                { caption: "transport-2.jpg", size: 872378, width: "120px", url: "{$url}", key: 2 },
                { caption: "transport-3.jpg", size: 632762, width: "120px", url: "{$url}", key: 3 }
            ]
        });
        $("#file-4").fileinput({
            theme: 'fas',
            uploadExtraData: { kvId: '10' }
        });
        $(".btn-warning").on('click', function () {
            var $el = $("#file-4");
            if ($el.attr('disabled')) {
                $el.fileinput('enable');
            } else {
                $el.fileinput('disable');
            }
        });
        $(".btn-info").on('click', function () {
            $("#file-4").fileinput('refresh', { previewClass: 'bg-info' });
        });
        /*
         $('#file-4').on('fileselectnone', function() {
         alert('Huh! You selected no files.');
         });
         $('#file-4').on('filebrowse', function() {
         alert('File browse clicked for #file-4');
         });
         */
        $(document).ready(function () {
            $("#test-upload").fileinput({
                'theme': 'fas',
                'showPreview': false,
                'allowedFileExtensions': ['jpg', 'png', 'gif'],
                'elErrorContainer': '#errorBlock'
            });
            $("#kv-explorer").fileinput({
                'theme': 'explorer-fas',
                'uploadUrl': '#',
                overwriteInitial: false,
                initialPreviewAsData: true,
                initialPreview: [
                    //"http://lorempixel.com/1920/1080/nature/1",
                    //"http://lorempixel.com/1920/1080/nature/2",
                    //"http://lorempixel.com/1920/1080/nature/3"
                ],
                initialPreviewConfig: [
                    { caption: "nature-1.jpg", size: 329892, width: "120px", url: "{$url}", key: 1 },
                    { caption: "nature-2.jpg", size: 872378, width: "120px", url: "{$url}", key: 2 },
                    { caption: "nature-3.jpg", size: 632762, width: "120px", url: "{$url}", key: 3 }
                ]
            });
            /*
             $("#test-upload").on('fileloaded', function(event, file, previewId, index) {
             alert('i = ' + index + ', id = ' + previewId + ', file = ' + file.name);
             });
             */
        });
    </script>
    <script>


        $('#hide').click(function () {
            $('#content').show('blind');
            $('#show').show();
            $('#hide').hide();
        });

        $('#show').click(function () {
            $('#content').hide('blind');
            $('#hide').show();
            $('#show').hide();
        });


    //$('#mydiv').addClass('newclass');
    //$('#mydiv').removeClass('newclass');
    //document.getElementById('your_element_s_id').className = 'cssClass';
    </script>--%>
    <script>
        function GetUserValue() {
            var person = prompt("Porfavor Ingrese motivo de rechazo:", "Información Apócrifa");
            if (person != null && person != "") {
                document.getElementById("<%=txtrechazo.ClientID%>").value = person;
                return true;
            }
            else
                return false;
        }
    </script>
    <script>
        window.onload = function myFunction() {
            var checkBox = document.getElementById("<%=chkVerificacion.ClientID%>");
            var text = document.getElementById("<%=sino.ClientID%>");
            if (checkBox.checked == true) {
                document.getElementById("<%=sino.ClientID%>").innerHTML = "Sí";
                }
                else {
                    document.getElementById("<%=sino.ClientID%>").innerHTML = "No";
            }
        }
    </script> 
    <script>
               function myFunction() {
                      var checkBox = document.getElementById("<%=chkVerificacion.ClientID%>");
            var text = document.getElementById("<%=sino.ClientID%>");
            if (checkBox.checked == true) {
                document.getElementById("<%=sino.ClientID%>").innerHTML = "Sí";
                }
                else {
                    document.getElementById("<%=sino.ClientID%>").innerHTML = "No";
                      }
                  }
    </script>

</asp:Content>

