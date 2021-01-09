package visuals.ui.elements.leaderboard
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.icons.SymbolIconSortArrowGeneric;
   
   public class SymbolLeaderboardCharacterContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLeaderboardCharacterContent = null;
      
      public var line1:SymbolLeaderboardLineGeneric = null;
      
      public var line2:SymbolLeaderboardLineGeneric = null;
      
      public var line3:SymbolLeaderboardLineGeneric = null;
      
      public var line4:SymbolLeaderboardLineGeneric = null;
      
      public var line5:SymbolLeaderboardLineGeneric = null;
      
      public var line6:SymbolLeaderboardLineGeneric = null;
      
      public var line7:SymbolLeaderboardLineGeneric = null;
      
      public var line8:SymbolLeaderboardLineGeneric = null;
      
      public var line9:SymbolLeaderboardLineGeneric = null;
      
      public var line10:SymbolLeaderboardLineGeneric = null;
      
      public var line11:SymbolLeaderboardLineGeneric = null;
      
      public var line12:SymbolLeaderboardLineGeneric = null;
      
      public var checkOnlySameLocale:SymbolUiCheckboxGeneric = null;
      
      public var txtOnlySameLocale:ILabelArea = null;
      
      public var txtPositionCaption:ILabel = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var txtGuildCaption:ILabel = null;
      
      public var txtLevelCaption:ILabel = null;
      
      public var txtHonorCaption:ILabel = null;
      
      public var iconSortByHonor:SymbolIconSortArrowGeneric = null;
      
      public var iconSortByLevel:SymbolIconSortArrowGeneric = null;
      
      public var txtFansCaption:ILabel = null;
      
      public var iconSortByFans:SymbolIconSortArrowGeneric = null;
      
      public function SymbolLeaderboardCharacterContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLeaderboardCharacterContent;
         }
         else
         {
            _nativeObject = new SymbolLeaderboardCharacterContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         line1 = new SymbolLeaderboardLineGeneric(_nativeObject.line1);
         line2 = new SymbolLeaderboardLineGeneric(_nativeObject.line2);
         line3 = new SymbolLeaderboardLineGeneric(_nativeObject.line3);
         line4 = new SymbolLeaderboardLineGeneric(_nativeObject.line4);
         line5 = new SymbolLeaderboardLineGeneric(_nativeObject.line5);
         line6 = new SymbolLeaderboardLineGeneric(_nativeObject.line6);
         line7 = new SymbolLeaderboardLineGeneric(_nativeObject.line7);
         line8 = new SymbolLeaderboardLineGeneric(_nativeObject.line8);
         line9 = new SymbolLeaderboardLineGeneric(_nativeObject.line9);
         line10 = new SymbolLeaderboardLineGeneric(_nativeObject.line10);
         line11 = new SymbolLeaderboardLineGeneric(_nativeObject.line11);
         line12 = new SymbolLeaderboardLineGeneric(_nativeObject.line12);
         checkOnlySameLocale = new SymbolUiCheckboxGeneric(_nativeObject.checkOnlySameLocale);
         txtOnlySameLocale = FlashLabelArea.fromNative(_nativeObject.txtOnlySameLocale);
         txtPositionCaption = FlashLabel.fromNative(_nativeObject.txtPositionCaption);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         txtGuildCaption = FlashLabel.fromNative(_nativeObject.txtGuildCaption);
         txtLevelCaption = FlashLabel.fromNative(_nativeObject.txtLevelCaption);
         txtHonorCaption = FlashLabel.fromNative(_nativeObject.txtHonorCaption);
         iconSortByHonor = new SymbolIconSortArrowGeneric(_nativeObject.iconSortByHonor);
         iconSortByLevel = new SymbolIconSortArrowGeneric(_nativeObject.iconSortByLevel);
         txtFansCaption = FlashLabel.fromNative(_nativeObject.txtFansCaption);
         iconSortByFans = new SymbolIconSortArrowGeneric(_nativeObject.iconSortByFans);
      }
      
      public function setNativeInstance(param1:SymbolLeaderboardCharacterContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.line1)
         {
            line1.setNativeInstance(_nativeObject.line1);
         }
         if(_nativeObject.line2)
         {
            line2.setNativeInstance(_nativeObject.line2);
         }
         if(_nativeObject.line3)
         {
            line3.setNativeInstance(_nativeObject.line3);
         }
         if(_nativeObject.line4)
         {
            line4.setNativeInstance(_nativeObject.line4);
         }
         if(_nativeObject.line5)
         {
            line5.setNativeInstance(_nativeObject.line5);
         }
         if(_nativeObject.line6)
         {
            line6.setNativeInstance(_nativeObject.line6);
         }
         if(_nativeObject.line7)
         {
            line7.setNativeInstance(_nativeObject.line7);
         }
         if(_nativeObject.line8)
         {
            line8.setNativeInstance(_nativeObject.line8);
         }
         if(_nativeObject.line9)
         {
            line9.setNativeInstance(_nativeObject.line9);
         }
         if(_nativeObject.line10)
         {
            line10.setNativeInstance(_nativeObject.line10);
         }
         if(_nativeObject.line11)
         {
            line11.setNativeInstance(_nativeObject.line11);
         }
         if(_nativeObject.line12)
         {
            line12.setNativeInstance(_nativeObject.line12);
         }
         if(_nativeObject.checkOnlySameLocale)
         {
            checkOnlySameLocale.setNativeInstance(_nativeObject.checkOnlySameLocale);
         }
         FlashLabelArea.setNativeInstance(txtOnlySameLocale,_nativeObject.txtOnlySameLocale);
         FlashLabel.setNativeInstance(txtPositionCaption,_nativeObject.txtPositionCaption);
         FlashLabel.setNativeInstance(txtNameCaption,_nativeObject.txtNameCaption);
         FlashLabel.setNativeInstance(txtGuildCaption,_nativeObject.txtGuildCaption);
         FlashLabel.setNativeInstance(txtLevelCaption,_nativeObject.txtLevelCaption);
         FlashLabel.setNativeInstance(txtHonorCaption,_nativeObject.txtHonorCaption);
         if(_nativeObject.iconSortByHonor)
         {
            iconSortByHonor.setNativeInstance(_nativeObject.iconSortByHonor);
         }
         if(_nativeObject.iconSortByLevel)
         {
            iconSortByLevel.setNativeInstance(_nativeObject.iconSortByLevel);
         }
         FlashLabel.setNativeInstance(txtFansCaption,_nativeObject.txtFansCaption);
         if(_nativeObject.iconSortByFans)
         {
            iconSortByFans.setNativeInstance(_nativeObject.iconSortByFans);
         }
      }
   }
}
