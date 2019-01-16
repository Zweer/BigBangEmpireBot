package com.playata.application.ui.elements.dungeon
{
   import com.playata.application.data.dungeon.Dungeon;
   import com.playata.application.ui.ViewManager;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ISprite;
   import com.playata.framework.display.Sprite;
   import flash.geom.Point;
   import visuals.dungeon_paths.SymbolDungeon1_1PathGeneric;
   import visuals.dungeon_paths.SymbolDungeon1_2PathGeneric;
   import visuals.dungeon_paths.SymbolDungeon1_3PathGeneric;
   import visuals.dungeon_paths.SymbolDungeon2_1PathGeneric;
   import visuals.dungeon_paths.SymbolDungeon2_2PathGeneric;
   import visuals.dungeon_paths.SymbolDungeon2_3PathGeneric;
   import visuals.dungeon_paths.SymbolDungeon3_1PathGeneric;
   import visuals.dungeon_paths.SymbolDungeon3_2PathGeneric;
   import visuals.dungeon_paths.SymbolDungeon3_3PathGeneric;
   import visuals.dungeon_paths.SymbolDungeonPathCheckPointGeneric;
   
   public class UiDungeonPath
   {
      
      private static var _pathCache:StringMap = new StringMap();
       
      
      private var _pathLayer:Sprite = null;
      
      private var _currentPath:ISprite = null;
      
      private var _currentNativePath:Object = null;
      
      private var _onDrawProgressCompleted:Function = null;
      
      public function UiDungeonPath(param1:Sprite)
      {
         super();
         _pathLayer = param1;
         _pathCache.setData("burning_bernie_1",new SymbolDungeon1_1PathGeneric());
         _pathCache.setData("burning_bernie_2",new SymbolDungeon1_2PathGeneric());
         _pathCache.setData("burning_bernie_3",new SymbolDungeon1_3PathGeneric());
         _pathCache.setData("flaming_wheels_1",new SymbolDungeon2_1PathGeneric());
         _pathCache.setData("flaming_wheels_2",new SymbolDungeon2_2PathGeneric());
         _pathCache.setData("flaming_wheels_3",new SymbolDungeon2_3PathGeneric());
         _pathCache.setData("whiplash_1",new SymbolDungeon3_1PathGeneric());
         _pathCache.setData("whiplash_2",new SymbolDungeon3_2PathGeneric());
         _pathCache.setData("whiplash_3",new SymbolDungeon3_3PathGeneric());
      }
      
      public function dispose() : void
      {
      }
      
      public function get pathLayer() : Sprite
      {
         return _pathLayer;
      }
      
      public function refresh(param1:Dungeon, param2:Boolean, param3:Function = null, param4:Boolean = false) : void
      {
         _onDrawProgressCompleted = !!param2?param3:null;
         var _loc5_:String = param1.identifier + "_" + param1.currentLevel.level;
         if(!_pathCache.exists(_loc5_))
         {
            var _loc6_:* = param1.identifier;
            switch(_loc6_)
            {
               case "burning_bernie":
                  switch(int(param1.currentLevel.level) - 1)
                  {
                     case 0:
                        _pathCache.setData(_loc5_,new SymbolDungeon1_1PathGeneric());
                        break;
                     case 1:
                        _pathCache.setData(_loc5_,new SymbolDungeon1_2PathGeneric());
                        break;
                     case 2:
                        _pathCache.setData(_loc5_,new SymbolDungeon1_3PathGeneric());
                  }
                  break;
               case "flaming_wheels":
                  switch(int(param1.currentLevel.level) - 1)
                  {
                     case 0:
                        _pathCache.setData(_loc5_,new SymbolDungeon2_1PathGeneric());
                        break;
                     case 1:
                        _pathCache.setData(_loc5_,new SymbolDungeon2_2PathGeneric());
                        break;
                     case 2:
                        _pathCache.setData(_loc5_,new SymbolDungeon2_3PathGeneric());
                  }
                  break;
               case "whiplash":
                  switch(int(param1.currentLevel.level) - 1)
                  {
                     case 0:
                        _pathCache.setData(_loc5_,new SymbolDungeon3_1PathGeneric());
                        break;
                     case 1:
                        _pathCache.setData(_loc5_,new SymbolDungeon3_2PathGeneric());
                        break;
                     case 2:
                        _pathCache.setData(_loc5_,new SymbolDungeon3_3PathGeneric());
                  }
            }
         }
         _currentPath = _pathCache.getData(_loc5_) as ISprite;
         _currentNativePath = _currentPath;
         showCheckPoint(1,param1.progressIndex > 0 || param4);
         showCheckPoint(2,param1.progressIndex > 1 || param4);
         showCheckPoint(3,param1.progressIndex > 2 || param4);
         showCheckPoint(4,param1.progressIndex > 3 || param4);
         showCheckPoint(5,param1.progressIndex > 4 || param4);
         showCheckPoint(6,param1.progressIndex > 5 || param4);
         showCheckPoint(7,param1.progressIndex > 6 || param4);
         showCheckPoint(8,param1.progressIndex > 7 || param4);
         showCheckPoint(9,param1.progressIndex > 8 || param4);
         showCheckPoint(10,param1.progressIndex > 9 || param4);
         showCheckPoint(11,param1.progressIndex > 10 || param4);
         showCheckPoint(12,param1.progressIndex > 11 || param4);
         showCheckPoint(13,param1.progressIndex > 12 || param4);
         showCheckPoint(14,param1.progressIndex > 13 || param4);
         _pathLayer.removeAllChildren();
         _pathLayer.visible = param1.progressIndex > 0 || param4;
         if(param4)
         {
            _pathLayer.addChild(_currentPath);
         }
         else if(param1.progressIndex > 0)
         {
            _pathLayer.addChild(_currentPath);
            if(param2)
            {
               drawProgressFrom(param1.progressIndex);
            }
         }
      }
      
      public function get previousButtonCoordinates() : Point
      {
         if(!_currentPath)
         {
            return new Point();
         }
         var _loc1_:* = 25;
         var _loc2_:* = -10;
         if(_currentNativePath.hasOwnProperty("checkpoint1") && _currentNativePath.hasOwnProperty("checkpoint2") && !_currentNativePath.checkpoint2.visible)
         {
            return new Point(_currentNativePath.checkpoint1.x + _loc1_,_currentNativePath.checkpoint1.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint2") && _currentNativePath.hasOwnProperty("checkpoint3") && !_currentNativePath.checkpoint3.visible)
         {
            return new Point(_currentNativePath.checkpoint2.x + _loc1_,_currentNativePath.checkpoint2.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint3") && _currentNativePath.hasOwnProperty("checkpoint4") && !_currentNativePath.checkpoint4.visible)
         {
            return new Point(_currentNativePath.checkpoint3.x + _loc1_,_currentNativePath.checkpoint3.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint4") && _currentNativePath.hasOwnProperty("checkpoint5") && !_currentNativePath.checkpoint5.visible)
         {
            return new Point(_currentNativePath.checkpoint4.x + _loc1_,_currentNativePath.checkpoint4.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint5") && _currentNativePath.hasOwnProperty("checkpoint6") && !_currentNativePath.checkpoint6.visible)
         {
            return new Point(_currentNativePath.checkpoint5.x + _loc1_,_currentNativePath.checkpoint5.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint6") && _currentNativePath.hasOwnProperty("checkpoint7") && !_currentNativePath.checkpoint7.visible)
         {
            return new Point(_currentNativePath.checkpoint6.x + _loc1_,_currentNativePath.checkpoint6.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint7") && _currentNativePath.hasOwnProperty("checkpoint8") && !_currentNativePath.checkpoint8.visible)
         {
            return new Point(_currentNativePath.checkpoint7.x + _loc1_,_currentNativePath.checkpoint7.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint8") && _currentNativePath.hasOwnProperty("checkpoint9") && !_currentNativePath.checkpoint9.visible)
         {
            return new Point(_currentNativePath.checkpoint8.x + _loc1_,_currentNativePath.checkpoint8.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint9") && _currentNativePath.hasOwnProperty("checkpoint10") && !_currentNativePath.checkpoint10.visible)
         {
            return new Point(_currentNativePath.checkpoint9.x + _loc1_,_currentNativePath.checkpoint9.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint10") && _currentNativePath.hasOwnProperty("checkpoint11") && !_currentNativePath.checkpoint11.visible)
         {
            return new Point(_currentNativePath.checkpoint10.x + _loc1_,_currentNativePath.checkpoint10.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint11") && _currentNativePath.hasOwnProperty("checkpoint12") && !_currentNativePath.checkpoint12.visible)
         {
            return new Point(_currentNativePath.checkpoint11.x + _loc1_,_currentNativePath.checkpoint11.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint12") && _currentNativePath.hasOwnProperty("checkpoint13") && !_currentNativePath.checkpoint13.visible)
         {
            return new Point(_currentNativePath.checkpoint12.x + _loc1_,_currentNativePath.checkpoint12.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint13") && _currentNativePath.hasOwnProperty("checkpoint14") && !_currentNativePath.checkpoint14.visible)
         {
            return new Point(_currentNativePath.checkpoint13.x + _loc1_,_currentNativePath.checkpoint13.y + _loc2_);
         }
         return new Point();
      }
      
      public function get currentButtonCoordinates() : Point
      {
         if(!_currentPath)
         {
            return new Point();
         }
         var _loc1_:* = 25;
         var _loc2_:* = -10;
         if(_currentNativePath.hasOwnProperty("checkpoint1") && !_currentNativePath.checkpoint1.visible)
         {
            return new Point(_currentNativePath.checkpoint1.x + _loc1_,_currentNativePath.checkpoint1.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint2") && !_currentNativePath.checkpoint2.visible)
         {
            return new Point(_currentNativePath.checkpoint2.x + _loc1_,_currentNativePath.checkpoint2.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint3") && !_currentNativePath.checkpoint3.visible)
         {
            return new Point(_currentNativePath.checkpoint3.x + _loc1_,_currentNativePath.checkpoint3.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint4") && !_currentNativePath.checkpoint4.visible)
         {
            return new Point(_currentNativePath.checkpoint4.x + _loc1_,_currentNativePath.checkpoint4.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint5") && !_currentNativePath.checkpoint5.visible)
         {
            return new Point(_currentNativePath.checkpoint5.x + _loc1_,_currentNativePath.checkpoint5.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint6") && !_currentNativePath.checkpoint6.visible)
         {
            return new Point(_currentNativePath.checkpoint6.x + _loc1_,_currentNativePath.checkpoint6.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint7") && !_currentNativePath.checkpoint7.visible)
         {
            return new Point(_currentNativePath.checkpoint7.x + _loc1_,_currentNativePath.checkpoint7.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint8") && !_currentNativePath.checkpoint8.visible)
         {
            return new Point(_currentNativePath.checkpoint8.x + _loc1_,_currentNativePath.checkpoint8.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint9") && !_currentNativePath.checkpoint9.visible)
         {
            return new Point(_currentNativePath.checkpoint9.x + _loc1_,_currentNativePath.checkpoint9.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint10") && !_currentNativePath.checkpoint10.visible)
         {
            return new Point(_currentNativePath.checkpoint10.x + _loc1_,_currentNativePath.checkpoint10.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint11") && !_currentNativePath.checkpoint11.visible)
         {
            return new Point(_currentNativePath.checkpoint11.x + _loc1_,_currentNativePath.checkpoint11.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint12") && !_currentNativePath.checkpoint12.visible)
         {
            return new Point(_currentNativePath.checkpoint12.x + _loc1_,_currentNativePath.checkpoint12.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint13") && !_currentNativePath.checkpoint13.visible)
         {
            return new Point(_currentNativePath.checkpoint13.x + _loc1_,_currentNativePath.checkpoint13.y + _loc2_);
         }
         if(_currentNativePath.hasOwnProperty("checkpoint14") && !_currentNativePath.checkpoint14.visible)
         {
            return new Point(_currentNativePath.checkpoint14.x + _loc1_,_currentNativePath.checkpoint14.y + _loc2_);
         }
         return new Point();
      }
      
      private function drawProgressFrom(param1:int) : void
      {
         progressIndex = param1;
         ViewManager.instance.baseUserPanel.allowMainNavigationButtons(false);
         var i:int = 1;
         while(i <= 20)
         {
            var step:IDisplayObject = _currentPath.getChildByName("step" + progressIndex + "_" + i);
            if(step)
            {
               step.visible = false;
               i = Number(i) + 1;
               continue;
            }
            break;
         }
         var checkPoint:SymbolDungeonPathCheckPointGeneric = _currentPath.getChildByName("checkpoint" + progressIndex) as SymbolDungeonPathCheckPointGeneric;
         if(checkPoint)
         {
            checkPoint.visible = true;
            checkPoint.completed.visible = true;
         }
         var currentStepIndex:int = 1;
         var drawProgressPoint:Function = null;
         drawProgressPoint = function():void
         {
            Environment.audio.playFX("dungeon_point_progress.mp3");
            var _loc1_:IDisplayObject = _currentPath.getChildByName("step" + progressIndex + "_" + currentStepIndex);
            if(!_loc1_)
            {
               showCheckPoint(progressIndex,true);
               ViewManager.instance.baseUserPanel.allowMainNavigationButtons(true);
               if(_onDrawProgressCompleted != null)
               {
                  _onDrawProgressCompleted();
               }
            }
            else
            {
               _loc1_.visible = true;
               currentStepIndex = Number(currentStepIndex) + 1;
               Runtime.delayFunction(drawProgressPoint,0.3);
            }
         };
         Runtime.delayFunction(drawProgressPoint,0.3);
      }
      
      private function showCheckPoint(param1:int, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc5_:* = null;
         _loc3_ = 1;
         while(_loc3_ <= 20)
         {
            _loc5_ = _currentPath.getChildByName("step" + param1 + "_" + _loc3_);
            if(_loc5_)
            {
               _loc5_.visible = param2;
               _loc3_++;
               continue;
            }
            break;
         }
         var _loc6_:SymbolDungeonPathCheckPointGeneric = _currentPath.getChildByName("checkpoint" + param1) as SymbolDungeonPathCheckPointGeneric;
         if(_loc6_)
         {
            _loc6_.visible = param2;
            _loc6_.completed.visible = param2;
            _loc6_.baseVIP.visible = false;
         }
         var _loc4_:IDisplayObject = _currentPath.getChildByName("overlayHide" + param1);
         if(_loc4_)
         {
            _loc4_.visible = !param2;
         }
      }
   }
}
