all_dir = dir('D:\Users\sam\Desktop\out\0601')
all_dir.name
all_dir.folder

output_dir = 'D:\Users\sam\Desktop\graph'
for i = 3:numel(all_dir)
    file = [all_dir(i).folder,'\', all_dir(i).name]
    file_dir = dir(file)
    for j =3:numel(file_dir)
        filename = [file_dir(j).folder, '\', file_dir(j).name];
        splitfilename = strsplit(file_dir(j).name, '_');
        splitwithoutxlsx = strsplit(splitfilename{end},'.');
        dataArr = xlsread(filename);
        m1_cpu = dataArr(:, 1);
        m2_cpu = dataArr(:, 2);
        m3_cpu = dataArr(:, 3);
        m1_mem = dataArr(:, 4);
        m2_mem = dataArr(:, 5);
        m3_mem = dataArr(:, 6);
        average_cpu = mean(dataArr(:, 1:3), 2)
        average_mem = mean(dataArr(:, 4:6), 2)
        x0=10;
        y0=10;
        width=700;
        height=400;
        plot((20:+20:600), average_cpu)
        title([splitfilename(1:end-1), splitwithoutxlsx(1), 'cpu']);
        set(gcf,'units','points','position',[x0,y0,width,height]);
        set(gca,'XTick',(0:20:600));
        xlabel(['time']);
        ylabel(['average cpu usage']);
        saveas(gcf, strcat(output_dir,'\',string(splitfilename(1)),'_',string(splitfilename(2)) ,'_', string(splitwithoutxlsx(1)),'_cpu.png'))
        
        plot((20:+20:600), average_mem)
        title([splitfilename(1:end-1), splitwithoutxlsx(1), 'mem']);
        set(gcf,'units','points','position',[x0,y0,width,height]);
        set(gca,'XTick',(0:20:600));
        xlabel(['time']);
        ylabel(['average mem usage']);
        saveas(gcf, strcat(output_dir,'\',string(splitfilename(1)),'_',string(splitfilename(2)) ,'_', string(splitwithoutxlsx(1)),'_mem.png'))
        
    end
end

