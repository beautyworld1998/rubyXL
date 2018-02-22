# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: rubyXL 3.3.28 ruby lib

Gem::Specification.new do |s|
  s.name = "rubyXL"
  s.version = "3.3.28"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Vivek Bhagwat", "Wesha"]
  s.date = "2018-02-22"
  s.description = "rubyXL is a gem which allows the parsing, creation, and manipulation of Microsoft Excel (.xlsx/.xlsm) Documents"
  s.email = "bhagwat.vivek@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".codeclimate.yml",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/rubyXL.rb",
    "lib/rubyXL/cell.rb",
    "lib/rubyXL/convenience_methods.rb",
    "lib/rubyXL/objects/border.rb",
    "lib/rubyXL/objects/calculation_chain.rb",
    "lib/rubyXL/objects/cell_style.rb",
    "lib/rubyXL/objects/chartsheet.rb",
    "lib/rubyXL/objects/color.rb",
    "lib/rubyXL/objects/column_range.rb",
    "lib/rubyXL/objects/comments.rb",
    "lib/rubyXL/objects/container_nodes.rb",
    "lib/rubyXL/objects/content_types.rb",
    "lib/rubyXL/objects/data_validation.rb",
    "lib/rubyXL/objects/document_properties.rb",
    "lib/rubyXL/objects/extensions.rb",
    "lib/rubyXL/objects/external_links.rb",
    "lib/rubyXL/objects/fill.rb",
    "lib/rubyXL/objects/filters.rb",
    "lib/rubyXL/objects/font.rb",
    "lib/rubyXL/objects/formula.rb",
    "lib/rubyXL/objects/ooxml_object.rb",
    "lib/rubyXL/objects/reference.rb",
    "lib/rubyXL/objects/relationships.rb",
    "lib/rubyXL/objects/root.rb",
    "lib/rubyXL/objects/shared_strings.rb",
    "lib/rubyXL/objects/sheet_common.rb",
    "lib/rubyXL/objects/sheet_data.rb",
    "lib/rubyXL/objects/simple_types.rb",
    "lib/rubyXL/objects/storage.rb",
    "lib/rubyXL/objects/stylesheet.rb",
    "lib/rubyXL/objects/text.rb",
    "lib/rubyXL/objects/theme.rb",
    "lib/rubyXL/objects/workbook.rb",
    "lib/rubyXL/objects/worksheet.rb",
    "lib/rubyXL/parser.rb",
    "lib/rubyXL/worksheet.rb",
    "rdoc/README_rdoc.html",
    "rdoc/RubyXL.html",
    "rdoc/RubyXL/AExtension.html",
    "rdoc/RubyXL/AExtensionStorageArea.html",
    "rdoc/RubyXL/ActiveX.html",
    "rdoc/RubyXL/ActiveXBinary.html",
    "rdoc/RubyXL/AdjustHandleList.html",
    "rdoc/RubyXL/Alignment.html",
    "rdoc/RubyXL/AlternateContent.html",
    "rdoc/RubyXL/Authors.html",
    "rdoc/RubyXL/AutoFilter.html",
    "rdoc/RubyXL/AutoFilterColumn.html",
    "rdoc/RubyXL/BinaryImageFile.html",
    "rdoc/RubyXL/BodyProperties.html",
    "rdoc/RubyXL/BooleanNode.html",
    "rdoc/RubyXL/BooleanValue.html",
    "rdoc/RubyXL/Border.html",
    "rdoc/RubyXL/BorderEdge.html",
    "rdoc/RubyXL/Borders.html",
    "rdoc/RubyXL/Break.html",
    "rdoc/RubyXL/BreakList.html",
    "rdoc/RubyXL/CT_AdjPoint2D.html",
    "rdoc/RubyXL/CT_AlphaBiLevelEffect.html",
    "rdoc/RubyXL/CT_AlphaModulateEffect.html",
    "rdoc/RubyXL/CT_AlphaModulateFixedEffect.html",
    "rdoc/RubyXL/CT_AlphaOutsetEffect.html",
    "rdoc/RubyXL/CT_AlphaReplaceEffect.html",
    "rdoc/RubyXL/CT_Backdrop.html",
    "rdoc/RubyXL/CT_Bevel.html",
    "rdoc/RubyXL/CT_BiLevelEffect.html",
    "rdoc/RubyXL/CT_BlendEffect.html",
    "rdoc/RubyXL/CT_Blip.html",
    "rdoc/RubyXL/CT_BlipFillProperties.html",
    "rdoc/RubyXL/CT_BlurEffect.html",
    "rdoc/RubyXL/CT_Camera.html",
    "rdoc/RubyXL/CT_Color.html",
    "rdoc/RubyXL/CT_ColorChangeEffect.html",
    "rdoc/RubyXL/CT_ColorMapping.html",
    "rdoc/RubyXL/CT_ColorScheme.html",
    "rdoc/RubyXL/CT_ColorSchemeAndMapping.html",
    "rdoc/RubyXL/CT_ConnectionSite.html",
    "rdoc/RubyXL/CT_ConnectionSiteList.html",
    "rdoc/RubyXL/CT_DashStop.html",
    "rdoc/RubyXL/CT_DashStopList.html",
    "rdoc/RubyXL/CT_DefaultShapeDefinition.html",
    "rdoc/RubyXL/CT_DuotoneEffect.html",
    "rdoc/RubyXL/CT_EffectContainer.html",
    "rdoc/RubyXL/CT_EffectList.html",
    "rdoc/RubyXL/CT_EffectReference.html",
    "rdoc/RubyXL/CT_EffectStyleItem.html",
    "rdoc/RubyXL/CT_EffectStyleList.html",
    "rdoc/RubyXL/CT_EmbeddedWAVAudioFile.html",
    "rdoc/RubyXL/CT_FillEffect.html",
    "rdoc/RubyXL/CT_FillOverlayEffect.html",
    "rdoc/RubyXL/CT_FillStyleList.html",
    "rdoc/RubyXL/CT_FlatText.html",
    "rdoc/RubyXL/CT_FontCollection.html",
    "rdoc/RubyXL/CT_FontReference.html",
    "rdoc/RubyXL/CT_GeomGuideList.html",
    "rdoc/RubyXL/CT_GlowEffect.html",
    "rdoc/RubyXL/CT_GradientFillProperties.html",
    "rdoc/RubyXL/CT_GradientStop.html",
    "rdoc/RubyXL/CT_GradientStopList.html",
    "rdoc/RubyXL/CT_HSLEffect.html",
    "rdoc/RubyXL/CT_HslColor.html",
    "rdoc/RubyXL/CT_Hyperlink.html",
    "rdoc/RubyXL/CT_InnerShadowEffect.html",
    "rdoc/RubyXL/CT_LightRig.html",
    "rdoc/RubyXL/CT_LineEndProperties.html",
    "rdoc/RubyXL/CT_LineJoinMiterProperties.html",
    "rdoc/RubyXL/CT_LineProperties.html",
    "rdoc/RubyXL/CT_LineStyleList.html",
    "rdoc/RubyXL/CT_LinearShadeProperties.html",
    "rdoc/RubyXL/CT_LuminanceEffect.html",
    "rdoc/RubyXL/CT_ObjectStyleDefaults.html",
    "rdoc/RubyXL/CT_OuterShadowEffect.html",
    "rdoc/RubyXL/CT_Path2D.html",
    "rdoc/RubyXL/CT_Path2DArcTo.html",
    "rdoc/RubyXL/CT_Path2DCubicBezierTo.html",
    "rdoc/RubyXL/CT_Path2DList.html",
    "rdoc/RubyXL/CT_Path2DQuadBezierTo.html",
    "rdoc/RubyXL/CT_Path2DTo.html",
    "rdoc/RubyXL/CT_PathShadeProperties.html",
    "rdoc/RubyXL/CT_PatternFillProperties.html",
    "rdoc/RubyXL/CT_Point3D.html",
    "rdoc/RubyXL/CT_PolarAdjustHandle.html",
    "rdoc/RubyXL/CT_PresetColor.html",
    "rdoc/RubyXL/CT_PresetLineDashProperties.html",
    "rdoc/RubyXL/CT_PresetShadowEffect.html",
    "rdoc/RubyXL/CT_PresetTextShape.html",
    "rdoc/RubyXL/CT_ReflectionEffect.html",
    "rdoc/RubyXL/CT_RelativeOffsetEffect.html",
    "rdoc/RubyXL/CT_RelativeRect.html",
    "rdoc/RubyXL/CT_SRgbColor.html",
    "rdoc/RubyXL/CT_ScRgbColor.html",
    "rdoc/RubyXL/CT_Scene3D.html",
    "rdoc/RubyXL/CT_SchemeColor.html",
    "rdoc/RubyXL/CT_Shape3D.html",
    "rdoc/RubyXL/CT_ShapeStyle.html",
    "rdoc/RubyXL/CT_SoftEdgesEffect.html",
    "rdoc/RubyXL/CT_SphereCoords.html",
    "rdoc/RubyXL/CT_StretchInfoProperties.html",
    "rdoc/RubyXL/CT_StyleMatrix.html",
    "rdoc/RubyXL/CT_StyleMatrixReference.html",
    "rdoc/RubyXL/CT_SupplementalFont.html",
    "rdoc/RubyXL/CT_SystemColor.html",
    "rdoc/RubyXL/CT_TextAutonumberBullet.html",
    "rdoc/RubyXL/CT_TextBlipBullet.html",
    "rdoc/RubyXL/CT_TextCharBullet.html",
    "rdoc/RubyXL/CT_TextCharacterProperties.html",
    "rdoc/RubyXL/CT_TextFont.html",
    "rdoc/RubyXL/CT_TextListStyle.html",
    "rdoc/RubyXL/CT_TextNormalAutofit.html",
    "rdoc/RubyXL/CT_TextParagraphProperties.html",
    "rdoc/RubyXL/CT_TextSpacing.html",
    "rdoc/RubyXL/CT_TextTabStop.html",
    "rdoc/RubyXL/CT_TextTabStopList.html",
    "rdoc/RubyXL/CT_TileInfoProperties.html",
    "rdoc/RubyXL/CT_TintEffect.html",
    "rdoc/RubyXL/CT_Transform2D.html",
    "rdoc/RubyXL/CT_TransformEffect.html",
    "rdoc/RubyXL/CT_Vector3D.html",
    "rdoc/RubyXL/CT_XYAdjustHandle.html",
    "rdoc/RubyXL/CalculationChain.html",
    "rdoc/RubyXL/CalculationChainCell.html",
    "rdoc/RubyXL/CalculationProperties.html",
    "rdoc/RubyXL/Cell.html",
    "rdoc/RubyXL/CellConvenienceMethods.html",
    "rdoc/RubyXL/CellExt.html",
    "rdoc/RubyXL/CellSmartTag.html",
    "rdoc/RubyXL/CellSmartTagProperty.html",
    "rdoc/RubyXL/CellSmartTags.html",
    "rdoc/RubyXL/CellStyle.html",
    "rdoc/RubyXL/CellStyleXFs.html",
    "rdoc/RubyXL/CellStyles.html",
    "rdoc/RubyXL/CellValue.html",
    "rdoc/RubyXL/CellWatch.html",
    "rdoc/RubyXL/CellWatches.html",
    "rdoc/RubyXL/CellXFs.html",
    "rdoc/RubyXL/ChartColorsFile.html",
    "rdoc/RubyXL/ChartFile.html",
    "rdoc/RubyXL/ChartStyleFile.html",
    "rdoc/RubyXL/ChartUserShapesFile.html",
    "rdoc/RubyXL/Chartsheet.html",
    "rdoc/RubyXL/ChartsheetPageSetup.html",
    "rdoc/RubyXL/ChartsheetProperties.html",
    "rdoc/RubyXL/ChartsheetProtection.html",
    "rdoc/RubyXL/ChartsheetView.html",
    "rdoc/RubyXL/ChartsheetViews.html",
    "rdoc/RubyXL/Color.html",
    "rdoc/RubyXL/ColorFilter.html",
    "rdoc/RubyXL/ColorScale.html",
    "rdoc/RubyXL/ColorSet.html",
    "rdoc/RubyXL/Colors.html",
    "rdoc/RubyXL/ColumnRange.html",
    "rdoc/RubyXL/ColumnRanges.html",
    "rdoc/RubyXL/Comment.html",
    "rdoc/RubyXL/CommentList.html",
    "rdoc/RubyXL/CommentsFile.html",
    "rdoc/RubyXL/ConditionalFormatValue.html",
    "rdoc/RubyXL/ConditionalFormatting.html",
    "rdoc/RubyXL/ConditionalFormattingRule.html",
    "rdoc/RubyXL/ContentTypeDefault.html",
    "rdoc/RubyXL/ContentTypeOverride.html",
    "rdoc/RubyXL/ContentTypes.html",
    "rdoc/RubyXL/ControlPropertiesFile.html",
    "rdoc/RubyXL/CorePropertiesFile.html",
    "rdoc/RubyXL/CustomColor.html",
    "rdoc/RubyXL/CustomColorList.html",
    "rdoc/RubyXL/CustomFilter.html",
    "rdoc/RubyXL/CustomFilters.html",
    "rdoc/RubyXL/CustomGeometry.html",
    "rdoc/RubyXL/CustomProperties.html",
    "rdoc/RubyXL/CustomPropertiesFile.html",
    "rdoc/RubyXL/CustomProperty.html",
    "rdoc/RubyXL/CustomSheetView.html",
    "rdoc/RubyXL/CustomSheetViews.html",
    "rdoc/RubyXL/CustomWorkbookView.html",
    "rdoc/RubyXL/CustomWorkbookViews.html",
    "rdoc/RubyXL/CustomXMLFile.html",
    "rdoc/RubyXL/DXF.html",
    "rdoc/RubyXL/DXFs.html",
    "rdoc/RubyXL/DataBar.html",
    "rdoc/RubyXL/DataConsolidate.html",
    "rdoc/RubyXL/DataConsolidationReference.html",
    "rdoc/RubyXL/DataConsolidationReferences.html",
    "rdoc/RubyXL/DataType.html",
    "rdoc/RubyXL/DataValidation.html",
    "rdoc/RubyXL/DataValidations.html",
    "rdoc/RubyXL/DateGroupItem.html",
    "rdoc/RubyXL/DefinedName.html",
    "rdoc/RubyXL/DefinedNameExt.html",
    "rdoc/RubyXL/DefinedNames.html",
    "rdoc/RubyXL/DefinedNamesExt.html",
    "rdoc/RubyXL/DocumentPropertiesFile.html",
    "rdoc/RubyXL/DrawingFile.html",
    "rdoc/RubyXL/DynamicFilter.html",
    "rdoc/RubyXL/EmbeddedControl.html",
    "rdoc/RubyXL/EmbeddedControls.html",
    "rdoc/RubyXL/Extension.html",
    "rdoc/RubyXL/ExtensionStorageArea.html",
    "rdoc/RubyXL/Extents.html",
    "rdoc/RubyXL/ExternalBook.html",
    "rdoc/RubyXL/ExternalLinksFile.html",
    "rdoc/RubyXL/ExternalReference.html",
    "rdoc/RubyXL/ExternalReferences.html",
    "rdoc/RubyXL/ExtraColorSchemeList.html",
    "rdoc/RubyXL/FieldItem.html",
    "rdoc/RubyXL/FileRecoveryProperties.html",
    "rdoc/RubyXL/FileSharing.html",
    "rdoc/RubyXL/FileVersion.html",
    "rdoc/RubyXL/Fill.html",
    "rdoc/RubyXL/Fills.html",
    "rdoc/RubyXL/FilterContainer.html",
    "rdoc/RubyXL/FloatNode.html",
    "rdoc/RubyXL/FloatValue.html",
    "rdoc/RubyXL/Font.html",
    "rdoc/RubyXL/FontConvenienceMethods.html",
    "rdoc/RubyXL/FontScheme.html",
    "rdoc/RubyXL/Fonts.html",
    "rdoc/RubyXL/Formula.html",
    "rdoc/RubyXL/FunctionGroup.html",
    "rdoc/RubyXL/FunctionGroups.html",
    "rdoc/RubyXL/GenericStorageObject.html",
    "rdoc/RubyXL/GradientFill.html",
    "rdoc/RubyXL/HeaderFooterSettings.html",
    "rdoc/RubyXL/Hyperlink.html",
    "rdoc/RubyXL/HyperlinkRelFile.html",
    "rdoc/RubyXL/Hyperlinks.html",
    "rdoc/RubyXL/IconFilter.html",
    "rdoc/RubyXL/IconSet.html",
    "rdoc/RubyXL/IgnoredError.html",
    "rdoc/RubyXL/IgnoredErrors.html",
    "rdoc/RubyXL/IndexedColors.html",
    "rdoc/RubyXL/InputCells.html",
    "rdoc/RubyXL/IntegerNode.html",
    "rdoc/RubyXL/IntegerValue.html",
    "rdoc/RubyXL/LegacyCell.html",
    "rdoc/RubyXL/LegacyWorksheet.html",
    "rdoc/RubyXL/MRUColors.html",
    "rdoc/RubyXL/MacrosFile.html",
    "rdoc/RubyXL/MergedCell.html",
    "rdoc/RubyXL/MergedCells.html",
    "rdoc/RubyXL/NumFmt.html",
    "rdoc/RubyXL/NumberFormat.html",
    "rdoc/RubyXL/NumberFormats.html",
    "rdoc/RubyXL/OLEObject.html",
    "rdoc/RubyXL/OLEObjectFile.html",
    "rdoc/RubyXL/OLEObjects.html",
    "rdoc/RubyXL/OLESize.html",
    "rdoc/RubyXL/OOXMLContainerObject.html",
    "rdoc/RubyXL/OOXMLIgnored.html",
    "rdoc/RubyXL/OOXMLObject.html",
    "rdoc/RubyXL/OOXMLObjectClassMethods.html",
    "rdoc/RubyXL/OOXMLObjectInstanceMethods.html",
    "rdoc/RubyXL/OOXMLRelationshipsFile.html",
    "rdoc/RubyXL/OOXMLTopLevelObject.html",
    "rdoc/RubyXL/Offset.html",
    "rdoc/RubyXL/OutlineProperties.html",
    "rdoc/RubyXL/PageMargins.html",
    "rdoc/RubyXL/PageSetup.html",
    "rdoc/RubyXL/PageSetupProperties.html",
    "rdoc/RubyXL/Pane.html",
    "rdoc/RubyXL/Parser.html",
    "rdoc/RubyXL/PatternFill.html",
    "rdoc/RubyXL/PhoneticProperties.html",
    "rdoc/RubyXL/PhoneticRun.html",
    "rdoc/RubyXL/PivotArea.html",
    "rdoc/RubyXL/PivotCache.html",
    "rdoc/RubyXL/PivotCacheDefinitionFile.html",
    "rdoc/RubyXL/PivotCacheRecordsFile.html",
    "rdoc/RubyXL/PivotCaches.html",
    "rdoc/RubyXL/PivotReference.html",
    "rdoc/RubyXL/PivotReferences.html",
    "rdoc/RubyXL/PivotTableFile.html",
    "rdoc/RubyXL/PivotTableSelection.html",
    "rdoc/RubyXL/PresetGeometry.html",
    "rdoc/RubyXL/PrintOptions.html",
    "rdoc/RubyXL/PrinterSettingsFile.html",
    "rdoc/RubyXL/ProtectedRange.html",
    "rdoc/RubyXL/ProtectedRanges.html",
    "rdoc/RubyXL/Protection.html",
    "rdoc/RubyXL/RID.html",
    "rdoc/RubyXL/RawOOXML.html",
    "rdoc/RubyXL/Reference.html",
    "rdoc/RubyXL/Relationship.html",
    "rdoc/RubyXL/RelationshipSupport.html",
    "rdoc/RubyXL/RelationshipSupport/ClassMehods.html",
    "rdoc/RubyXL/RevisionPointer.html",
    "rdoc/RubyXL/RichText.html",
    "rdoc/RubyXL/RichTextRun.html",
    "rdoc/RubyXL/Row.html",
    "rdoc/RubyXL/RowExt.html",
    "rdoc/RubyXL/RunProperties.html",
    "rdoc/RubyXL/Scenario.html",
    "rdoc/RubyXL/Scenarios.html",
    "rdoc/RubyXL/Selection.html",
    "rdoc/RubyXL/ShapeGuide.html",
    "rdoc/RubyXL/ShapeTextRectangle.html",
    "rdoc/RubyXL/SharedStringsTable.html",
    "rdoc/RubyXL/Sheet.html",
    "rdoc/RubyXL/SheetCalculationProperties.html",
    "rdoc/RubyXL/SheetData.html",
    "rdoc/RubyXL/SheetDataExt.html",
    "rdoc/RubyXL/SheetDataSet.html",
    "rdoc/RubyXL/SheetName.html",
    "rdoc/RubyXL/SheetNames.html",
    "rdoc/RubyXL/Sheets.html",
    "rdoc/RubyXL/SlicerCacheFile.html",
    "rdoc/RubyXL/SlicerFile.html",
    "rdoc/RubyXL/SmartTagProperties.html",
    "rdoc/RubyXL/SmartTagType.html",
    "rdoc/RubyXL/SmartTagTypes.html",
    "rdoc/RubyXL/SmartTags.html",
    "rdoc/RubyXL/SortCondition.html",
    "rdoc/RubyXL/SortState.html",
    "rdoc/RubyXL/Sqref.html",
    "rdoc/RubyXL/Stop.html",
    "rdoc/RubyXL/StringNode.html",
    "rdoc/RubyXL/StringNodeW3C.html",
    "rdoc/RubyXL/StringValue.html",
    "rdoc/RubyXL/Stylesheet.html",
    "rdoc/RubyXL/TableFile.html",
    "rdoc/RubyXL/TableParts.html",
    "rdoc/RubyXL/TableStyle.html",
    "rdoc/RubyXL/TableStyles.html",
    "rdoc/RubyXL/Text.html",
    "rdoc/RubyXL/Theme.html",
    "rdoc/RubyXL/ThemeElements.html",
    "rdoc/RubyXL/ThumbnailFile.html",
    "rdoc/RubyXL/Top10.html",
    "rdoc/RubyXL/VMLDrawingFile.html",
    "rdoc/RubyXL/Variant.html",
    "rdoc/RubyXL/Vector.html",
    "rdoc/RubyXL/VectorValue.html",
    "rdoc/RubyXL/VisualProperties.html",
    "rdoc/RubyXL/WebPublishObject.html",
    "rdoc/RubyXL/WebPublishObjects.html",
    "rdoc/RubyXL/WebPublishingItem.html",
    "rdoc/RubyXL/WebPublishingItems.html",
    "rdoc/RubyXL/WebPublishingProperties.html",
    "rdoc/RubyXL/Workbook.html",
    "rdoc/RubyXL/WorkbookConvenienceMethods.html",
    "rdoc/RubyXL/WorkbookProperties.html",
    "rdoc/RubyXL/WorkbookProtection.html",
    "rdoc/RubyXL/WorkbookRoot.html",
    "rdoc/RubyXL/WorkbookView.html",
    "rdoc/RubyXL/WorkbookViews.html",
    "rdoc/RubyXL/Worksheet.html",
    "rdoc/RubyXL/WorksheetConvenienceMethods.html",
    "rdoc/RubyXL/WorksheetDimensions.html",
    "rdoc/RubyXL/WorksheetFormatProperties.html",
    "rdoc/RubyXL/WorksheetProperties.html",
    "rdoc/RubyXL/WorksheetProtection.html",
    "rdoc/RubyXL/WorksheetView.html",
    "rdoc/RubyXL/WorksheetViews.html",
    "rdoc/RubyXL/XF.html",
    "rdoc/created.rid",
    "rdoc/css/fonts.css",
    "rdoc/css/rdoc.css",
    "rdoc/fonts/Lato-Light.ttf",
    "rdoc/fonts/Lato-LightItalic.ttf",
    "rdoc/fonts/Lato-Regular.ttf",
    "rdoc/fonts/Lato-RegularItalic.ttf",
    "rdoc/fonts/SourceCodePro-Bold.ttf",
    "rdoc/fonts/SourceCodePro-Regular.ttf",
    "rdoc/images/add.png",
    "rdoc/images/arrow_up.png",
    "rdoc/images/brick.png",
    "rdoc/images/brick_link.png",
    "rdoc/images/bug.png",
    "rdoc/images/bullet_black.png",
    "rdoc/images/bullet_toggle_minus.png",
    "rdoc/images/bullet_toggle_plus.png",
    "rdoc/images/date.png",
    "rdoc/images/delete.png",
    "rdoc/images/find.png",
    "rdoc/images/loadingAnimation.gif",
    "rdoc/images/macFFBgHack.png",
    "rdoc/images/package.png",
    "rdoc/images/page_green.png",
    "rdoc/images/page_white_text.png",
    "rdoc/images/page_white_width.png",
    "rdoc/images/plugin.png",
    "rdoc/images/ruby.png",
    "rdoc/images/tag_blue.png",
    "rdoc/images/tag_green.png",
    "rdoc/images/transparent.png",
    "rdoc/images/wrench.png",
    "rdoc/images/wrench_orange.png",
    "rdoc/images/zoom.png",
    "rdoc/index.html",
    "rdoc/js/darkfish.js",
    "rdoc/js/jquery.js",
    "rdoc/js/navigation.js",
    "rdoc/js/navigation.js.gz",
    "rdoc/js/search.js",
    "rdoc/js/search_index.js",
    "rdoc/js/search_index.js.gz",
    "rdoc/js/searcher.js",
    "rdoc/js/searcher.js.gz",
    "rdoc/table_of_contents.html",
    "rubyXL.gemspec",
    "spec/lib/cell_spec.rb",
    "spec/lib/color_spec.rb",
    "spec/lib/parser_spec.rb",
    "spec/lib/reference_spec.rb",
    "spec/lib/stylesheet_spec.rb",
    "spec/lib/text_spec.rb",
    "spec/lib/workbook_spec.rb",
    "spec/lib/worksheet_spec.rb",
    "spec/spec_helper.rb",
    "test/input/.gitkeep",
    "test/output/.gitkeep",
    "test/test_parse_write.rb",
    "tmp/.gitignore"
  ]
  s.homepage = "http://github.com/gilt/rubyXL"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "rubyXL is a gem which allows the parsing, creation, and manipulation of Microsoft Excel (.xlsx/.xlsm) Documents"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.4.4"])
      s.add_runtime_dependency(%q<rubyzip>, [">= 1.1.6"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<ruby-prof>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 1.4.4"])
      s.add_dependency(%q<rubyzip>, [">= 1.1.6"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<ruby-prof>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 1.4.4"])
    s.add_dependency(%q<rubyzip>, [">= 1.1.6"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<ruby-prof>, [">= 0"])
  end
end

