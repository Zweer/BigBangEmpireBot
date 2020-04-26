package com.playata.application.data.titles
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CTitle;
   import com.playata.application.data.user.User;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.localization.LocText;
   
   public class Titles
   {
      
      private static var _instance:Titles;
       
      
      private var _titles:Vector.<Title>;
      
      private var _titleLookup:StringMap;
      
      private var _marriageTitle:Title;
      
      public function Titles(param1:Object)
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super();
         if(_instance != null)
         {
            throw new Error("Titles can only have a single instance!");
         }
         _instance = this;
         _titles = new Vector.<Title>(0);
         _titleLookup = new StringMap();
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for(var _loc4_ in param1)
         {
            _loc2_ = param1[_loc4_];
            _loc3_ = new Title(_loc4_,_loc2_);
            if(_loc4_ != "title_marriage")
            {
               _titles.push(_loc3_);
               _titleLookup.setData(_loc4_,_loc3_);
            }
         }
         _titles.sort(sortByIndex);
         _marriageTitle = new Title("title_marriage",CTitle.fromId("title_marriage"));
      }
      
      public static function get instance() : Titles
      {
         return _instance;
      }
      
      public function getNameWithTitle(param1:String, param2:String, param3:String = "") : String
      {
         if(!param2)
         {
            return param1;
         }
         if(param3 == "")
         {
            param3 = !!User.current.character.isMale?"m":"f";
         }
         var _loc5_:int = param3 == "m"?1:2;
         var _loc7_:int = LocText.current.gender;
         LocText.current.gender = _loc5_;
         var _loc6_:Title = null;
         if(param2.indexOf("title_marriage") >= 0)
         {
            _marriageTitle.identifier = param2;
            _loc6_ = _marriageTitle;
         }
         else
         {
            _loc6_ = _titleLookup.getData(param2);
         }
         if(!_loc6_)
         {
            LocText.current.gender = _loc7_;
            return LocText.current.text("character/name_with_title",param1,param2);
         }
         var _loc4_:String = _loc6_.getNameWithTitle(param1);
         LocText.current.gender = _loc7_;
         return _loc4_;
      }
      
      public function getTitle(param1:String) : String
      {
         var _loc2_:Title = null;
         if(param1.indexOf("title_marriage") >= 0)
         {
            _marriageTitle.identifier = param1;
            _loc2_ = _marriageTitle;
         }
         else
         {
            _loc2_ = _titleLookup.getData(param1);
         }
         return _loc2_.title;
      }
      
      public function allTitles() : Vector.<Title>
      {
         return _titles.concat();
      }
      
      public function availableTitles(param1:Character) : Vector.<Title>
      {
         var _loc2_:Vector.<Title> = new Vector.<Title>(0);
         var _loc5_:int = 0;
         var _loc4_:* = _titles;
         for each(var _loc3_ in _titles)
         {
            if(param1.hasTitle(_loc3_))
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function isTitleAvailable(param1:Character, param2:String) : Boolean
      {
         var _loc3_:Title = _titleLookup.getData(param2);
         return param1.hasTitle(_loc3_);
      }
      
      private function sortByIndex(param1:Title, param2:Title) : int
      {
         return param1.index - param2.index;
      }
      
      public function flagAsNew(param1:String) : void
      {
         _titleLookup.getData(param1).isNew = true;
      }
   }
}
