package com.playata.application.ui.elements.guild
{
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import visuals.ui.base.SymbolUiArtifactTooltipGeneric;
   
   public class UiGuildArtifactTooltip extends UiClosableTooltip
   {
      
      private static var _tooltipContent:SymbolUiArtifactTooltipGeneric = null;
      
      private static var _artifact1:UiGuildArtifactTooltipItem = null;
      
      private static var _artifact2:UiGuildArtifactTooltipItem = null;
      
      private static var _artifact3:UiGuildArtifactTooltipItem = null;
      
      private static var _artifact4:UiGuildArtifactTooltipItem = null;
      
      private static var _artifact5:UiGuildArtifactTooltipItem = null;
       
      
      private var _artifactIds:Vector.<int> = null;
      
      public function UiGuildArtifactTooltip(param1:IInteractiveDisplayObject)
      {
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolUiArtifactTooltipGeneric();
            _artifact1 = new UiGuildArtifactTooltipItem(_tooltipContent.artifact1);
            _artifact2 = new UiGuildArtifactTooltipItem(_tooltipContent.artifact2);
            _artifact3 = new UiGuildArtifactTooltipItem(_tooltipContent.artifact3);
            _artifact4 = new UiGuildArtifactTooltipItem(_tooltipContent.artifact4);
            _artifact5 = new UiGuildArtifactTooltipItem(_tooltipContent.artifact5);
         }
         super(param1,_tooltipContent);
      }
      
      override public function onAssigned() : void
      {
         if(_artifactIds == null)
         {
            _tooltipContent.visible = false;
            return;
         }
         _artifact1.content.visible = _artifactIds.length >= 1;
         _artifact2.content.visible = _artifactIds.length >= 2;
         _artifact3.content.visible = _artifactIds.length >= 3;
         _artifact4.content.visible = _artifactIds.length >= 4;
         _artifact5.content.visible = _artifactIds.length >= 5;
         if(_artifactIds.length >= 1)
         {
            _artifact1.artifactId = _artifactIds[0];
         }
         if(_artifactIds.length >= 2)
         {
            _artifact2.artifactId = _artifactIds[1];
         }
         if(_artifactIds.length >= 3)
         {
            _artifact3.artifactId = _artifactIds[2];
         }
         if(_artifactIds.length >= 4)
         {
            _artifact4.artifactId = _artifactIds[3];
         }
         if(_artifactIds.length >= 5)
         {
            _artifact5.artifactId = _artifactIds[4];
         }
         var _loc2_:int = 0;
         if(_artifactIds.length >= 1 && _artifact1.contentWidth > _loc2_)
         {
            _loc2_ = _artifact1.contentWidth;
         }
         if(_artifactIds.length >= 2 && _artifact2.contentWidth > _loc2_)
         {
            _loc2_ = _artifact2.contentWidth;
         }
         if(_artifactIds.length >= 3 && _artifact3.contentWidth > _loc2_)
         {
            _loc2_ = _artifact3.contentWidth;
         }
         if(_artifactIds.length >= 4 && _artifact4.contentWidth > _loc2_)
         {
            _loc2_ = _artifact4.contentWidth;
         }
         if(_artifactIds.length >= 5 && _artifact5.contentWidth > _loc2_)
         {
            _loc2_ = _artifact5.contentWidth;
         }
         var _loc1_:int = 38;
         _tooltipContent.background.height = _artifactIds.length * (_artifact1.content.height + 3) + _loc1_;
         _tooltipContent.background.width = _loc2_ + 45 + 2 * _loc1_;
         placeCloseButton(_tooltipContent.background);
      }
      
      public function set artifactIds(param1:Vector.<int>) : void
      {
         _artifactIds = param1;
      }
   }
}
