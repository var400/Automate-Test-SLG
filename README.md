--Clone git start project
    ->  create folder
        ->  open terminal
            ->  git init
            #Create new branch
                -> git checkout -b main
                #Rename branch
                -> git branch -m main
                    #connect git
                    -> git remote add origin https://github.com/var400/Automate-Test-SLG.git
                        #pull project
                        -> git pull origin main

--When Update Code Or Edit
    #ในกรณีที่ต้องการเเก้โดยเเยก branch
    -> git pull origin main
         #Create new branch ชื่อเปลี่ยนได้
        ->  git checkout -b bugfix/fix-login-error
            -> edit code, add, fix bug
                #จะ add ทั้งหมดหรือชื่อไฟล์ก็ได้มันจะ add เเค่ไฟล์ที่เราเเก้
                ->  git add .
                    #commit โค้ด
                    -> git commit -m "Fix login error causing user session to fail"
                        #กลับไปยัง branch main เพื่อที่จะทำการ merge
                        ->git checkout main
                            #pull เพื่ออัพเดทโค้ดใน main
                            -> git pull origin main
                                #merge branch
                                -> git merge bugfix/fix-login-error
                                    #push ไปยัง git
                                    ->git push origin main

    #เเบบไม่เเยก branch
        #กำหนด branch ให้ตรงกับบนเว็บ
        -> git checkout -b main
            #pull เพื่ออัพเดทโค้ดเป็นล่าสุด
            -> git pull origin main
                -> edit code, add, fix bug
                    ->  git add .
                        ->  git commit -m ""
                            ->git push origin main


git branch -d feature-branch
--Git Command
git branch -r
git remote -v


#connect db robot
https://docs.robotframework.org/docs/different_libraries/database